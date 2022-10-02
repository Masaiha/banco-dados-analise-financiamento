SELECT *
  FROM cliente
  CROSS APPLY (
	SELECT fi.Id_Cliente as financiamentoClienteId
	  FROM Financiamento as fi
	  JOIN PARCELA as pa
	    ON fi.Id = pa.Id_financiamento
	 WHERE DATEDIFF(DAY, Vencimento, GETDATE()) > 5
	   AND pa.Data_Pagamento IS NULL
  ) as financiamentoComParcelasEmAtraso
 WHERE financiamentoComParcelasEmAtraso.financiamentoClienteId = cliente.Id

