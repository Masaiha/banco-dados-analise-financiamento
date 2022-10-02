  
;WITH FinanciamentoComMais60PorcentoParcelasPagas as (

	SELECT Financiamento.Id,
	     COUNT(Financiamento.Id) as dadas
	  FROM Financiamento
 CROSS APPLY(
		SELECT par.Id as idParcela
		  FROM PARCELA as par
		 WHERE par.Id_financiamento = Financiamento.Id
		   AND Data_Pagamento IS NOT NULL
	)as parcelas	
	GROUP BY Financiamento.Id

)SELECT * FROM FinanciamentoComMais60PorcentoParcelasPagas
