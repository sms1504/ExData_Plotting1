## Data Plotting 1
### Introduction
These notes describe an R Scripts which are used to create the project plots.

### Download the Data Set
The download script can be found in a file named `download.R`, in a function named `power.download()`. So, to run the script from an R Console, type:

```{r}
source('download.R')
power.download()
```

The script file also includes the `power.tidy()` function. This function is used by the plot functions, it tidies the dataset into a form suitable for plotting:

### Plotting
The scripts for generating the plots are contained in separate files as in the course instructions. Each plot has it's own generation function. We can generate the plots as follows:

```{r}
source('plot1.R')
plot1()

source('plot2.R')
plot2()

source('plot3.R')
plot3()

source('plot4.R')
plot4()

```
These functions generate files called `plot1.png`, `plot2.png`, `plot3.png` and `plot4.png` and places them in the current working directory.
