# Part One: Visual Exploratory Data Analysis

In this section, you have been assigned a dataset of interest, split across 3 files. You will perform visual and non-visual exploratory analysis to better understand the shape & structure of the data, investigate initial questions, and develop preliminary insights & hypotheses. Your final submission will take the form of a report consisting of captioned visualizations that convey key insights gained during your analysis.

**PLEASE READ THROUGH THE ASSIGNMENT IN IT'S ENTIRETY BEFORE BEGINNING. THERE ARE MANY REQUIREMENTS AND DETAILS.**


## Step 1: Data Ingestion and Munging

You have be assigned a corpus of related data files that you will explore. The data files are stored in the `part-1-data/` folder. A description of this data and the overall goals are given in `part-1-data-description.pdf]`.  You will need to do ingest this data into R or Python and prepare it for exploratory visual analysis.
er preparing the data.

Based on the data description — *but prior to analysis* — you should write down an initial set of **at least three different questions** you’d like to investigate. 

Note that the stated goals in the data description **cannot be used as your questions**, since the goals are abstract and general. The questions you want to investigate need to be more specific.

### Deliverables from Step 1 (10 points)

| Task                                                         | Points |
| ------------------------------------------------------------ | ------ |
| You will create an _analytic data set_ formed by appropriately joining the data in the 3 provided files. This data **must be tidy for the patient unit of analysis**, so there should be no data in the column headers, nor should there be any duplication of rows , among other properties that ensure the data is tidy. The column names must be in **[snake_case](https://en.wikipedia.org/wiki/Snake_case)** format, all lower case, or a format aligned with the code style you are following. This data will be stored in a file called **thrombosis.csv** and stored in the top-level folder. This file cannot have rownames/indices in it, only columns with the actual data, and descriptive column names. Missing values should be denoted by blanks or "" in the file, not "NA" or "NaN" or "nan" or "." or anything else. | 5      |
| The data munging to create the analytic data in 1 must be done via a R or Python script named `part-1-munging.R` or `part-1-munging.py`. | 5      |



## Step 2: Exploratory Visual Analysis

Next, you will perform an exploratory analysis of this dataset using R or Python. You should consider rapid prototyping rather than final presentation during your exploration phase. Your submission, however, **should contain publication-quality visualizations**. You should consider *two different phases* of exploration.

In the first phase, you should seek to *gain an overview* of the shape & structure of your dataset. What variables does the dataset contain? How are they distributed? Are there any notable data quality issues? Are there any surprising relationships among the variables? Be sure to also perform “sanity checks” for patterns you expect to see!

In the second phase, you should investigate your initial questions, as well as *any new questions* that arise during your exploration. For each question, start by creating a visualization that might provide a useful answer. Then refine the visualization (e.g., by adding additional variables, changing sorting or axis scales, transforming your data by filtering or subsetting it, etc.) to develop better perspectives, explore unexpected observations, or sanity check your assumptions. You should repeat this process for each of your questions, but feel free to revise your questions or branch off to explore new questions if the data warrants.

------

## Final Deliverable

Your final submission should take the form of a **HTML report**  that consists of **5 or more** captioned **static visualizations** detailing your most important insights. Your “insights” can include important surprises or issues (such as data quality problems affecting your analysis, missing data patterns) as well as responses to your analysis questions. To help you gauge the scope of this assignment, see [this example report](https://georgetown.box.com/s/24pddp9bb3auf9pf0j7hyo8bj1dfg729) analyzing data about motion pictures. We’ve annotated and graded this example to help you calibrate for the breadth and depth of exploration we’re looking for.

1. Each visualization image should be generated using R or Python code, have appropriate titles, labels and annotations,  and exported to an appropriate image format (png/jpg/pdf/svg). 
    + You are free, but not required, to annotate your images to draw attention to specific features of the data. 
2. In your report, **each figure must be accompanied with a title and descriptive caption (2-4 sentences long) describing the insight(s) learned from that view**.  Provide sufficient detail for each caption such that anyone could read through your figure and caption  and understand what you’ve learned from the figure. 
3. **The figures will be linked and contextualized through paragraph(s) of narrative content describing your questions and how you are finding answers to them**. 
3. Any intermediate data sets you may create must not be committed. Include them in the `.gitignore` file.

The end of your report should include a brief summary of main lessons learned, as well as commentary on what kinds of visualizations were useful and what kinds weren't for answering your questions. These could refer to figures in the report and/or other figures that you may have tried but didn't include in the report. 

### Deliverables from Step 2 (20 points)

Your submission will be the last commit in your assignment Github repository prior to the deadline.

1. A script file named `part-1-figures.R` or `part-1-figures.py` that has the code for each of the **5 or more graphics** required for this project. There **needs** to be useful comments in the script file that specifies which part of the code generates which graphic in your report, referring to the figures by number (see the next point). **(5 points)**

3. A report in **HTML** format named `part-1-report.html` that contains all the 5+ figures along with captions and narrative content explaining your EDA and linking the figures. Each figure must be numbered and labeled `Figure 1`, `Figure 2`,... `Figure 10` that you will refer to in the comments of your script file before the chunk of code that generates the figure. **(12 points)**

    + This should be a **well-formatted and styled report** using headers, paragraphs, the generated figures and captions, and any other features that increase the readability and navigability of the report for the reader. In other words, for the reader, the file should be easy to navigate, to move between sections or figures, and should be easy to read, both in terms of writing and in terms of visual presentation and experience, by incorporating format and style into the text and the overall page. It doesn't have to be a linear report but can also be slides or other formats, but must be a HTML page. 
    + If other files are required for this experience, they should be included in the submission. 
    + However, you **cannot use or create dynamic webpages like Shiny, Dash or Streamlit** for this submission; it should be a **static webpage or website** 
    + The reader should be able to double-click on the `part-1-report.html` file and be able to read and see your entire report/slides/etc and interact with it (changing pages, scrolling, clicking links, etc) in an obvious manner to see the entire report. 

4. All the figure files, named `figure1.png`, `figure2.png`, etc (or whatever the appropriate extension is for the file format you choose), should be  in a subfolder named `part-1-figures` that must be pushed to the Github repo. **(3 points)**

    ## Notes

    ### Creating the HTML report

    You can use RMarkdown (`part-1-report.Rmd`) or Jupyter notebooks (`part-1-report.ipynb`) to develop your final HTML document, but the actual submission we will evaluate will be **your code** (`figures.*`) and the **HTML document** (`part-1-report.html`) , *not the RMarkdown or Jupyter files.*  The `part-1-figures.R` or `part-1-figures.py` **must be part of the submission** regardless of whether you use RMarkdown or notebooks to create the presentation.  Your submission must also include the RMarkdown or Jupyter file, if you take this strategy. This strategy is **not required** but is permitted.

    > From a RMarkdown file, you can extract all the R code using `knitr::purl("part-1-report.Rmd")`, which will create a file `part-1-report.R`. You may need to edit this file to add the requisite comments
    >
    >  For Jupyter notebooks, you can use `jupyter nbconvert --no-prompt --to script part-1-report.ipynb` . There are also other methods available; see this [Stackoverflow thread](https://stackoverflow.com/questions/54350254/get-only-the-code-out-of-jupyter-notebook) .

    You can use other means to create your HTML document, as you choose, like MS Word, Google Docs, Google Slides, Keynote, MS Powerpoint, or other tools. However, as mentioned above, **you are required** to submit your script (`figures.R` or `figures.py`) code that generates all your visualizations, regardless of how you create the HTML document.

    ### Figures

    Your visualizations should be **static visualizations**, and not dynamic/interactive visualization (no Javascript) nor require any running R or Python server to see (no Shiny/Dash/Streamlit)

    

    

## Expectations

The following is a guide regarding our expectations for your work on this task. This is directional and the final specific rubric will be based on this. These expectations are _in addition to_ the general expectations.

| Component                | Excellent                                                    | Satisfactory                                                 | Poor                                                         |
| ------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Breadth of Exploration   | More than 3 questions were initially asked, and target substantially different portions/aspects of the data. | At least 3 questions were initially asked of the data, but there is some overlap between questions. | Fewer than 3 initial questions were posed of the data.       |
| Depth of Exploration     | A sufficient number of follow-up questions were asked to yield insights that helped to more deeply explore the initial questions. | Some follow-up questions were asked, but they did not take the analysis much deeper than the initial questions. | No follow-up questions were asked after answering the initial questions. |
| Data Quality             | Data quality was thoroughly assessed with extensive profiling of fields and records. | Simple checks were conducted on only a handful of fields or records. | Little or no evidence that data quality was assessed.        |
| Visualizations           | More than 10 visualizations were produced, and a variety of  marks and encodings were explored. All design decisions were both  expressive and effective. | At least 10 visualizations were produced. The visual encodings chosen were largely effective and expressive, but some errors remain. | Several ineffective or inexpressive design choices are made. Fewer than 10 visualizations have been produced. |
| Data Transformation      | More advanced transformation were used to extend the dataset in interesting or useful ways. | Simple transforms (e.g., sorting, filtering) were primarily used. | The raw dataset was used directly, with little to no additional transformation. |
| Captions                 | Captions richly describe the visualizations and contextualize the insight within the analysis. | Captions do a good job describing the visualizations, but could better connect prior or subsequent steps of the analysis. | Captions are missing, overly brief, or shallow in their analysis of visualizations. |
| Creativity & Originality | You exceeded the parameters of the assignment, with original insights or a particularly engaging design. | You met all the parameters of the assignment.                | You met most of the parameters of the assignment.            |
