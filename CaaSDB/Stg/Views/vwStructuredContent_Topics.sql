
CREATE VIEW [Stg].[vwStructuredContent_Topics] AS (


SELECT a.[Language]
      ,a.[ContentType]
      ,a.[Title]
      ,a.[HWID]
      ,a.[ContentId]
	  ,b.AspectId
	  ,b.AspectLabel
	  ,b.ConceptId
	  ,b.ConceptLabel
	  ,case when b.ConceptAlternativeLabels = 'NULL' then NULL else b.ConceptAlternativeLabels end as ConceptAlternativeLabels
	  ,b.TopConceptId
	  ,b.TopConceptLabel
	  ,b.AspectId_2
	  ,b.AspectLabel_2
	  ,b.ConceptId_2
	  ,b.ConceptLabel_2
	  ,case when b.ConceptAlternativeLabels_2 = 'NULL' then NULL else b.ConceptAlternativeLabels_2 end as ConceptAlternativeLabels_2
	  ,b.TopConceptId_2
	  ,b.TopConceptLabel_2
      --,a.[AspectLabel] as AspectLabel_array
      --,a.[AspectId] as AspectId_array
      --,a.[ConceptLabel] as ConceptLabel_array
      --,a.[ConceptId] as ConceptId_array
      ,a.[Taxonomy]
      ,a.[FHWVISIBILITY]
      --,a.[FHWCERTIFICATIONDATE]
	  ,CAST(SUBSTRING(a.[FHWCERTIFICATIONDATE],4,2) + '/' + SUBSTRING(a.[FHWCERTIFICATIONDATE],1,2) + '/' + SUBSTRING(a.[FHWCERTIFICATIONDATE],7,4) as DATE) as [FHWCERTIFICATIONDATE]  
      --,a.[FHWLASTREVIEWEDDATE]
	  ,CAST(SUBSTRING(a.[FHWLASTREVIEWEDDATE],4,2) + '/' + SUBSTRING(a.[FHWLASTREVIEWEDDATE],1,2) + '/' + SUBSTRING(a.[FHWLASTREVIEWEDDATE],7,4) as DATE) as [FHWLASTREVIEWEDDATE]
      --,a.[FHWNEXTMEDICALREVIEWDATE]
	  ,CAST(SUBSTRING(a.[FHWNEXTMEDICALREVIEWDATE],4,2) + '/' + SUBSTRING(a.[FHWNEXTMEDICALREVIEWDATE],1,2) + '/' + SUBSTRING(a.[FHWNEXTMEDICALREVIEWDATE],7,4) as DATE) as [FHWNEXTMEDICALREVIEWDATE]
      --,a.[FHWLASTMEDICALREVIEWDATE]
      ,CAST(SUBSTRING(a.[FHWLASTMEDICALREVIEWDATE],4,2) + '/' + SUBSTRING(a.[FHWLASTMEDICALREVIEWDATE],1,2) + '/' + SUBSTRING(a.[FHWLASTMEDICALREVIEWDATE],7,4) as DATE) as [FHWLASTMEDICALREVIEWDATE]
	  ,a.[FHWPRIMARYMEDICALREVIEWER]
      ,a.[FSTATUS]
      ,a.[FAUTHOR]
      ,a.[VERSION]
      ,a.[FHWREADINGLEVELN]
      ,a.[FHWAUDIENCE]
      ,a.[FHWCONTENTAREA]
      ,a.[FMODULETYPE]
      ,a.[DetailLevel]
FROM [Stg].[StructuredContent_DITAdoc] as a
--DITAdoc is the main source of Topics

  



--Now gather all of the Concept info as a sub query
LEFT JOIN 
(
	SELECT
	DocumentId
	,max(AspectId) as AspectId
	,max(AspectLabel) as AspectLabel
	,max(ConceptId) as ConceptId
	,max(ConceptLabel) as ConceptLabel
	,max(ConceptAlternativeLabels) as ConceptAlternativeLabels
	,max(TopConceptId) as TopConceptId
	,max(TopConceptLabel) as TopConceptLabel
	,max(AspectId_2) as AspectId_2
	,max(AspectLabel_2) as AspectLabel_2
	,max(ConceptId_2) as ConceptId_2
	,max(ConceptLabel_2) as ConceptLabel_2
	,max(ConceptAlternativeLabels_2) as ConceptAlternativeLabels_2
	,max(TopConceptId_2) as TopConceptId_2
	,max(TopConceptLabel_2) as TopConceptLabel_2
	FROM
	(
		select 
		[DocumentId]
		,case when RowNum = 1 then AspectLabel end as AspectLabel
		,case when RowNum = 1 then AspectId end as AspectId
		,case when RowNum = 1 then AspectTopic.ConceptId end as ConceptId
		,case when RowNum = 1 then ConceptLabel end as ConceptLabel
		,case when RowNum = 1 then ConceptAlternativeLabels end as ConceptAlternativeLabels
		,case when RowNum = 1 then TopConcept.TopConceptId end as TopConceptId
		,case when RowNum = 1 then TopConcept.TopConceptLabel end as TopConceptLabel
		,RowNum
		,case when RowNum = 2 then AspectLabel end as AspectLabel_2
		,case when RowNum = 2 then AspectId end as AspectId_2
		,case when RowNum = 2 then AspectTopic.ConceptId end as ConceptId_2
		,case when RowNum = 2 then ConceptLabel end as ConceptLabel_2
		,case when RowNum = 2 then ConceptAlternativeLabels end as ConceptAlternativeLabels_2
		,case when RowNum = 2 then TopConcept.TopConceptId end as TopConceptId_2
		,case when RowNum = 2 then TopConcept.TopConceptLabel end as TopConceptLabel_2
		from
			(--AspectTopic has the Topic/Aspect/Concept relationship. Business rules say there can be at most 2 Aspects/Concepts a Topic can belong to.
			 SELECT [ConceptAlternativeLabels]
				   ,[DocumentId]
				   ,[AspectLabel]
				   ,[AspectId]
				   ,[ConceptId]
				   ,[ConceptLabel]
				   ,ROW_NUMBER() OVER(PARTITION BY DocumentId ORDER BY DocumentId, ConceptId) as RowNum
			 FROM [Stg].[StructuredContent_AspectTopic]
			) as AspectTopic

		LEFT JOIN 
			(
			 SELECT DISTINCT 
			 [ConceptId]
			,[TopConceptId]
			,[TopConceptLabel]
			 FROM [Stg].[StructuredContent_synonym]
			) as TopConcept 
			  on AspectTopic.ConceptId = TopConcept.ConceptId

	WHERE AspectTopic.RowNum in (1,2)

	) as ConceptInfo

GROUP BY
DocumentId 
--We are selecting the max values in the SELECT clause above and grouping by DocumentId here so as to not inflate the number of rows in the result.
--essentially we are taking the extra row and putting the values into new columns: AspectId_2, etc.

) as b on a.ContentId = b.DocumentId



)