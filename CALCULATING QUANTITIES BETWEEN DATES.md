# CALCULATING QUANTITIES BETWEEN DATES 

<p align="justify">In some situations it is necessary to calculate quantities (sum, count) between dates in the same table. To demonstrate the calculation we will use the example of how to calculate the <b>headcount</b> KPI.</p>
<p align="justify">We will use variables, and filter context to link the table D_CALENDAR to the table of admission and dismissal dates.</p>
<p align="justify">To build the example we use part of the HRDataset_v13.csv dataset for modeling and calculating the KPI, available in the kaggle repository.</p>
<p align="justify"><b>Dataset:</b>https://www.kaggle.com/rhuebner/human-resources-data-set</p>
<br>
<b>STEPS</B>
<br>- How to calculate
<br>- Formatting the company's termination date in Query Editor
<br>- Creating Measure Table
<br>- Creating the Measure Headcount

## 1º STEP:
<p align="justify"><b>How to calculate</b></p>
<p align="justify">The calculation is performed from the difference between a minimum date and a maximum date</p>

## 2º STEP:
<p align="justify"><b>Formatting the company's termination date in Query Editor</b></p>
<p align="justify">Data field before</p>
<img width="124" alt="dt_before" src="https://user-images.githubusercontent.com/45472681/94950754-81ea2a00-04b9-11eb-9057-900012610143.png">
<p align="justify">Tor all null data records, we will assume the current date</p>
<p align="justify">The <b>DateTime.LocalNow () as datetime</b> function will return the current date</p>

```r

M language 
if [DT_RET] = null
then
DateTime.LocalNow() as datetime
else [DT_RET]
```
<p align="justify">Data field after the transformation of null fields</p>
<img width="124" alt="dt_before" src="https://user-images.githubusercontent.com/45472681/94960124-ad284580-04c8-11eb-9331-cd7103a00b07.png">


## 3º STEP:
<p align="justify"><b>Creating D_CALENDAR TABLE</b></p>
<img width="229" alt="New Table" src="https://user-images.githubusercontent.com/45472681/94940411-dedde400-04a9-11eb-8a35-0c4109091dfb.png">
<img src="https://user-images.githubusercontent.com/45472681/94974007-9ba06700-04e3-11eb-8854-f75c1f3259c9.png">
<p align="justify">Creating calculated columns</p>
<img src="https://user-images.githubusercontent.com/45472681/94974019-a3600b80-04e3-11eb-9dfc-b876286811bd.png">
<img src="https://user-images.githubusercontent.com/45472681/94974024-a824bf80-04e3-11eb-81a0-bd9b654b12f7.png">
<img src="https://user-images.githubusercontent.com/45472681/94974028-a955ec80-04e3-11eb-8e9d-0b5241b2c997.png">
<img src="https://user-images.githubusercontent.com/45472681/94974354-bf17e180-04e4-11eb-9216-f28ac0c5b418.png">
<p align="justify">Sorting column MONTH_TEXT by the MONTH_NUM</p>
<img src="https://user-images.githubusercontent.com/45472681/94974452-01d9b980-04e5-11eb-8067-42eb7ab8f6f5.png">

## 4º STEP:
<p align="justify"><b>Creating the Measure Headcount</b></p>

```r
HEADCOUNT = 

VAR currentdate = MAX(D_CALENDAR[DATE])

RETURN
IF(
    CALCULATE(
        COUNTA(HRDataset[EmpID]),
        FILTER(
            HRDataset,
            HRDataset[DT_ADM] <= currentdate
            && HRDataset[DT_RETIRE] >= currentdate
        )
    ) = BLANK(),
    CALCULATE(
        COUNTA(HRDataset[EmpID]),
        FILTER(
            HRDataset,
            HRDataset[DT_ADM] <= TODAY()
            && HRDataset[DT_RETIRE] >= TODAY()
        )
    ),
    CALCULATE(
        COUNTA(HRDataset[EmpID]),
        FILTER(
            HRDataset,
            HRDataset[DT_ADM] <= currentdate
            && HRDataset[DT_RETIRE] >= currentdate
        )
    )
)
```
