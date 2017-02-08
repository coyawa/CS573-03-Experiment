#Assignment 3 - Replicating a Classic Experiment

By Congyang Wang --- 2017/02/01

*Assignment 3: In this assignment I implemented a simple controlled experiment using some of the visualizations I've been building this semester. This experiment is based on the classic paper ([Download Link](http://www.math.pku.edu.cn/teachers/xirb/Courses/biostatistics/Biostatistics2016/GraphicalPerception_Jasa1984.pdf))  published in 1984 written by Cleveland & McGill*   
  
**Link:** http://coyawa.github.io/03-Experiment

##Description:

**Background:**   
In 1984, William Cleveland and Robert McGill published the results of several controlled experiments that pitted bar charts against pies and stacked-bar variants. This time I am going to try replicating this experiment.

**Goals:**
A controlled experiments!

 * a) **Test** three competing visualizations;
 * b) **Implement** data generation and error calculation functions from Cleveland and McGill's 1984 paper;
 * c) **Run** the experiment with 10 participants;
 * d) Do some basic **analysis** and reporting of the results.

##Experiment:  

I use the D3.js to build this experiment,  these screenshots are the Welcome page, Three charts test page, Experiment result page.  

**The Experiment On-boarding Page:**  
![](https://ww2.sinaimg.cn/large/006tKfTcgy1fcinwoe8x7j31680neacv.jpg)
---  
**Pie/Tree/Bar Charts Page:**  
![](https://ww1.sinaimg.cn/large/006tKfTcgy1fcio7vgxe5j31kw0pw0x6.jpg)
---
**Experiment Result Store:**. 
![](https://ww2.sinaimg.cn/large/006tKfTcgy1fciu1s0csij30z80z4442.jpg)

##Analysis

First, I use `python` to combine the 10 .csv experiment results.
 
```Python  
from glob import glob

with open('a3_par_all.csv', 'a') as singleFile:
    for csv in glob('*.csv'):
        if csv == 'a3_par_all.csv':
            pass
        else:
            for line in open(csv, 'r'):
                singleFile.write(line)
```  

Then, like the paper did, I use the **Log-base-2** to get the right ranking, 
> Why **Log-base-2**
> 1. Log scale is good for a relative error.
> 2. Add 1/8 can prevent a distortion of the scale at the bottom end because some cases have the zero absolute errors.
> 3. Log base 2 because average relative errors tended to change by factors less than 10.

Here is the result of three different chart：

| Chart Type | Log Error |
| --- | --- |
| Bar Chart | 1.33  |
| Pie Chart | 2.15 |
| Treemap Chart | 2.39 |

From the table we can see the the Bar Chart have the best performance and the Treemap Chart has the worst performance, there is a trick, as we learned from other researchers experiment results, pie chart could go worse than this score, but in my experiment, my pie chart looks more like the DOUNT, there is a inner circle in the chart, so the participates can got a better accuracy in the experiment.

**Result Order: Best to Worst**  
From this figure, we can find, the Log Error can reduce more gap between different charts, it can also reduce the bias as we mentioned before.  
![](https://ww2.sinaimg.cn/large/006tKfTcgy1fciurfrz8mj31520ygact.jpg)  

**Different Charts Comparison**  
Now, let us combine this experiment result with the Cleveland & McGill's Results, we can find the line chart have the almost same performance even after 20 years.

![](https://ww2.sinaimg.cn/large/006tKfTcgy1fciy0y8mt6j31b80tcq59.jpg)

**95% Bootstrap Confidence Interval** 
![](https://ww2.sinaimg.cn/large/006tKfTcgy1fciy4vv3ujj31ce0p0gmw.jpg)


##Technical and Design Achievement
* Every single trial use the random algorithm to display.
* More than 60 times observation for every participate, this may let the participate loss patient and we can get more accuracy result, 
* Error defined Scale using log-base-2 error. 
* Run at least 20 trials per visualization type. If you have 3 visualizations, run at least 60 random trials.
* As we learned the color of design in this week, I think I should use the different color to make the test more accuracy, at last, I use the blue color button in Welcome page to make the participates calm down and relax, then I use the orange color button to make them have more power to move forward, as we know, this is a 60 times experiment, need more focus power, through the whole experiment, the ProgressBar used the green color to show the current progress, keep the participate peaceful.

##For Me

I learn a tons of experience from this project, that's why there are more reference links I list at the end.  
But there are also more update work should be done in the near future, like implement the [Latin Square design](http://en.wikipedia.org/wiki/Latin_square) to ensure that the 60 trials are counterbalanced; Show the experiment result per participate data table in the End page; Try more comparison like Color vs No Color / Up down vs Left right / Big size vs Small size, etc.

**Reference:**   
http://codementum.org/cleveland-mcgill/  
http://stackoverflow.com/questions/2450954/how-to-randomize-shuffle-a-javascript-array  
http://bl.ocks.org/keithcollins/a0564c578b9328fcdcbb  
http://bl.ocks.org/d3noob/473f0cf66196a008cf99  
http://www.w3schools.com/css/css3_buttons.asp  
https://greenmzc.github.io/2016/11/07/D3-js上手——饼状图/   
https://leanpub.com/D3-Tips-and-Tricks  
http://blog.devdon.com/?p=3229  
https://www.r-bloggers.com/bootsrap-confidence-intervals-stratified-bootstrap/



