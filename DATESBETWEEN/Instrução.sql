--Função

Valor = 
    CALCULATE(
        SUM(data[Valor]), 
        DATESBETWEEN(
            data[Data_Venda],
            MAX(data[Data_Venda]) - 90,
            MAX(data[Data_Venda])
        )
    )
	
-- Nosso problema: Calcular o valor acumulado de vendas, 
-- nos ultimos 90 dias.

/*
Exemplo:
Data Atual: 16/09/2021
Data Atual -90: 16/06/2021
*/



	
	
	
	
	