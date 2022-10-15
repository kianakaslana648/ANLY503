# Assignment: Visual Exploratory Data Analysis (EDA), with honest and deceptive visualizations

**PLEASE READ THROUGH THE ASSIGNMENT IN IT'S ENTIRETY BEFORE BEGINNING. THERE ARE MANY REQUIREMENTS AND DETAILS.**

**THIS IS A LONG ASSIGNMENT. GIVE YOURSELF AMPLE TIME TO COMPLETE. YOU WILL NOT BE ABLE TO COMPLETE THIS IF YOU START A DAY OR TWO BEFORE IT IS DUE. DATA WRANGLING AND PREPARATION CAN BE VERY TEDIOUS AND TIME CONSUMING.** 

This assignment will have two parts. 

1. [Part One](part-1-instructions.md) has you performing visual exploratory data analysis (EDA) on a set of data provided in the `data-part-one/` folder. A description of this data is provided. The instructions for this part are [here](part-1-instructions.md) (30 points)
2. [Part Two](part-2-instructions.md) has you choose one of 3 recent public data sets, and perform data munging and EDA to decide on two visualizations, one "white hat" or honest, and the other "black hat" or deceptive, to represent the data. The instructions for this part are [here](part-2-instructions.md) (30 points)
3. **10 points** will be allotted for general issues in the submission common to the entire assignment
    1.  Correct file names and folder structure for the repo as specified in each part.
    2. Your code **must be properly formatted** using a standard style: the [tidyverse style](https://style.tidyverse.org) for `R`, and [pep8](https://pep8.org) for `Python`. It should also have *sections and descriptive comments* to aid the reader's understanding of the code and align the code to the various deliverables. Variable names and column names in data frames should be descriptive of the data they contain (no `x`, `V2`, etc. ) and also should be in a format consistent with the code style you are using. (see below). 
    3. Figures should be big enough to be easily readable on a 10 inch or larger screen (e.g. iPad, laptop). At that size, all titles, labels, and annotations should be clear and readable. 
    4. Proper use of git and Github
        +  no direct uploads to Github
        + everything staged, committed, and pushed from local repo 
        + [descriptive](https://www.freecodecamp.org/news/how-to-write-better-git-commit-messages/) [commit](https://www.freecodecamp.org/news/writing-good-commit-messages-a-practical-guide/) [messages](https://reflectoring.io/meaningful-commit-messages/) (or at least, attempts to do so)
        + `.gitignore` has all the necessary files to make the submission clean, as specified in the instructions

**Note on plotly and other dynamic visualization libraries:** In this assignment, the **only tools** you can use are ggplot2 and its extensions (in R) and matplotlib/seaborn (in Python). Any visualization that uses *dynamic visualization libraries* like **plotly, D3.js, Vega, htmlwidgets** or similar packages, and then submits a static screenshot or the dynamic visualization for their submission, will receive **0 points** for that visualization. Dynamic visualization libraries, or server-side tools like Shiny, Dash, Streamlit, etc, are **not allowed for this assignment**. If in doubt, ask. 

------

## Code formatting

Properly formatted code is the hallmark of a competent and professional programmer and team player, and is often _required_ in corporate environments. It makes reading code (your own and others) much much easier and more comprehensible, since the code becomes stylistically similar and you spend less time deciphering the code and more time actually coding and understanding code. This, in turn, lowers the effort required for code reviews and updates (and grading!).  The [tidyverse style](https://style.tidyverse.org) for R and the [pep8 style](https://pep8.org) for Python are widely used standards. _You should read them at least once to have an idea of what's expected in the style_. However, you **don't have to maintain these styles by hand!**.

For R, the **[styler](https://styler.r-lib.org)** package auto-formats R and RMarkdown files to the tidyverse standard. Installing it also installs an add-in to RStudio that makes it even easier to run. The **[lintr](https://github.com/r-lib/lintr)** package does _static code analysis_ and points out style, syntax and some semantic issues with your code, but doesn't modify your file. It also can be baked in to RStudio.

For Python, there are a couple of popular auto-formatters. The first, **[black](https://pypi.org/project/black/)**, takes a dictatorial view of formatting and doesn't allow much customization, but does its job beautifully, conforming to the pep8 standard and beyond. It also **[integrates with most editors](https://black.readthedocs.io/en/stable/integrations/editors.html)**.   The other, **[autopep8](https://pypi.org/project/autopep8/)** auto-formats Python script files to the pep8 standard. It also can be integrated into editors, but you need Google for the instructions. You can also do static code analysis using **[pylint](https://pylint.org)** and **[flake8](https://flake8.pycqa.org/en/latest/)**, which covers a broader range of problems with your code.

------

## Folder structure

A possible folder structure for a R-based submission is below. You may have more files or folders depending on how you create and what you put in to the web pages.

```bash
├── README.md
├── black-hat-data.csv
├── black-hat.py
├── data
├── id.yml
├── part-1-data
│   ├── TSUMOTO_A.CSV
│   ├── TSUMOTO_B.CSV
│   └── TSUMOTO_C.CSV
├── part-1-data-description.pdf
├── part-1-figures
│   ├── figure1.png
│   ├── figure2.png
│   ├── figure3.png
│   ├── figure4.png
│   ├── figure5.png
├── part-1-figures.R
├── part-1-munging.R
├── part-1-report.html
├── part-2-munging.R
├── part-2-submission.html
├── thrombosis.csv
├── white-hat-data.csv
└── white-hat.R
```

