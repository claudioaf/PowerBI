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
<p align="justify"><b>Data field before</b></p>
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
<p align="justify">After the transformation of null fields</p>
<img width="124" alt="dt_before" src="https://user-images.githubusercontent.com/45472681/94960124-ad284580-04c8-11eb-9331-cd7103a00b07.png">


## 3º STEP:
<p align="justify"><b>Creating D_CALENDAR TABLE</b></p>
<img width="229" alt="New Table" src="https://user-images.githubusercontent.com/45472681/94940411-dedde400-04a9-11eb-8a35-0c4109091dfb.png">
