# Assignment: Applying conceptual design best practices


## Introduction

This will be an assignment in two parts. In Part One you will **hand sketch** several visualizations based on a simplified version of some US Census data. In Part Two, you will use R or Python to create a single visualization from the raw, unprocessed Census data, using your data munging skills as well as visualization skills. 

> Read to the very end to see what a minimal submission meeting the requirements would look like. 

## Part One: Sketching visualizations to explore design principles (30 points)

### The Data

In this homework we will be looking at some demographic characteristics of the US population in 1900 and 2000, and use data visualization to contrast the time periods. 

Every 10 years, the census bureau documents the demographic make-up of the United States, influencing everything from congressional districting to social services. This simplified dataset contains a high-level summary of census data for two years a century apart: 1900 and 2000. The data is a table that describes the U.S. population in terms of year, reported sex, age group (binned into 5 year segments from 0-4 years old up to 90+ years old), and the total count of people per group. There are 38 data points per year, for a total of 76 data points.

<img src="https://user-images.githubusercontent.com/370335/151921907-75c5cd32-0622-4164-8824-1381afcf75d1.png"></img>



Source: [U.S. Census Bureau via IPUMS](http://ipums.org/)

### Your Tasks

1. Start by **choosing a question** you’d like a visualization to answer.
2. Design **3 different visualization paper sketches** (low-fidelity prototypes) that you believe effectively tackle the question.
3. Write **one paragraph per sketch** about the rationale for your design decisions. What was your motivation behind generating this sketch? What were you hoping it would communicate? What worked well and what didn’t?
4. Write **one paragraph** that reflects on all 3 of your sketches overall. Compare your designs with each other — what are their strengths and weaknesses? What new directions might you explore (e.g., synthesizing elements from every sketch, or describing why one of them is significantly better than the others?).

Your sketches should be interpretable without consulting your write-ups. Do not forget to include the title, axis labels or legends as needed!

We do not expect your sketches to include every datapoint, or even accurately represent the data (that’s why we’ve rounded all data values to the nearest 50,000!). The goal of this assignment is to draft different visualization designs. Thus, we do not expect your visualizations to be “perfect,” but rather communicate three ideas that you would plausibly be excited to continue exploring in the second part of this assignment. In fact, we encourage you to use sharpies/markers/felt-tip pens so that your lines are thicker and you are less focused on being “accurate.”

*Note: For this assignment, you should **not** analyze or visualize the data with software tools. We instead expect you to just look at the dataset and create hand-drawn sketches.*

### Tips and Inspiration

+ Use a sharpie/marker. Thick lines free you from worrying about the fine-grained details and accuracy of your sketch, and instead focus you on sketching the big picture ideas.
+ Similarly, we recommend using pens over pencils — not being able to “undo” your mistakes by erasing them can be remarkably conducive to generating designs.
+ You are free to use different colors and any other sketching techniques you can think of (e.g., dotted patterns, cross hatching, etc.).
+ You may sketch on touchscreen-enabled devices (e.g., iPads) but we do not recommend them for the same reasons as using pencils — it’s too easy to hit “undo.”
+ [How to Sketch, Doodle, and Draw Data Visualization Drafts by Hand](https://depictdatastudio.com/how-to-sketch-doodle-and-draw-data-visualization-drafts-by-hand/)
+ [Sketching with Data Opens the Mind’s Eye](https://medium.com/accurat-studio/sketching-with-data-opens-the-mind-s-eye-92d78554565)
+ For further reading, we recommend Bill Buxton’s [Sketching User Experiences book](https://books.google.com/books/about/Sketching_User_Experiences_Getting_the_D.html?id=2vfPxocmLh0C&printsec=frontcover&source=kp_read_button&newbks=1&newbks_redir=0#v=onepage&q&f=false)(which builds off the paper linked above).

### Deliverables

+ **Compile your sketches and writeups as a single PDF file**. This might best be achieved by writing your report, including the pictures of your sketches, in a Word document and then converting it to PDF. **Note, we will only allow PDF submissions, not in any other format**. This file must be named in the format **`part1.pdf`** and be located in the top level of your Git repository, ***not in any  sub-folder***. 
+ Make sure your images are sized for a reasonable viewing experience — readers should not have to zoom or scroll in order to effectively view any sketch!

### Assessment

Each sketch will be worth **8 points**, and will be judged on how well it is designed and addresses the question you posed. This includes, but is not limited to,  the logical use of visual encodings of the data, proper labeling, and the extent to which it is self-explanatory in answering an aspect of the question you are asking. 

The write-ups (1 paragraph per sketch + **critical** evaluation/comparison of your 3 sketches) will be worth **6 points in total**.  

-----

## Part Two: Designing and creating a visualization (40 points)

You will create a digital visualization for an extension of the dataset you were given in Part One, and provide a **rigorous rationale** for your design choices. In theory, you should be able to justify every single element in your visualization, down to the pixel.

The data is provided in raw form and will require you to use your data munging skills to create an analytic data set first. Given this fact, we would prefer that you use a programming visualization package from the R or Python ecosystems to finally create the visualization.

### The Data

The data is raw data available from the [U.S. Census Bureau](https://www.census.gov) and is freely available. We provide the data files for download at [this link](https://georgetown.box.com/s/k7cod215fasz2vnf17q1lrt59n9lw7lk). These files include:

1. `pe-11-*.csv` are the data from 1900 to 1970 by age (every 1-year), race (white, non-white) and sex
2. `National-intercensal-data-*.TXT` give data (to be extracted) from 1980 and 1990 by age (every 1-year), race (white, black, “American Indian, Eskimo, and Aleut”, and “Asian and Pacific Islander”) and sex. This data is in fixed-width format (very common in official data) and the key is provided in `National-intercensal-data-layout-1980-1990.txt`.
3. `National-intercensal-data-2000-2010.csv` has data (to be extracted) from April 2000 and April 2010 on age (5-year groups), race (white, black, “American Indian and Alaskan Native”, “Asian”, and“Native Hawaiian and Other Pacific Islander”). This data also has data on individuals self-identifying as “Two or more races”. The data information is in wide format, with the key provided in `National-intercensal-data-layout-2000-2010.pdf`.



**You will download these files into the `data/` sub-folder of your folder for this homework**. This is required. It is also required that these files are **not committed** in Git, by ensuring that  `data/*` is included in your homework repo's `.gitignore` file .

> The `.gitignore` file is a text file that specifies files or patterns of file names that **should not** be included in what Git monitors for staging and committing, and so they are not included in the repo in Github. [This link](https://www.atlassian.com/git/tutorials/saving-changes/gitignore) provides a nice introduction to the gitignore process and methods.
>
> Since the `.gitignore` file is just a text file, it can be edited using any of your programming tools like RStudio, Spyder, Visual Studio Code, PyCharm, etc., or even using Notepad (Win) or TextEdit (Mac) or Emacs/Vim/Nano (if you don't know what these are, don't worry). But it **has** to be in the top-level folder, or *root folder* of your repo. 

You will create a **single analytical data set** with the following properties:

1. Years from 1900 to 2010 every 10 years. When month data is available, you want to include data from April of that year
2. Ages by the 5 year groups that are provided in the 2000/2010 data (21 groups)
3. Sex (male/female)
4. Race (White/non-white). You can decide (be explicit) on how you deal with the multi-racial category. It’s important to note that Hispanics are an ethnicity and not a race under the Census categorization, so you should only take the data that is not further subdivided by Hispanic status.

You will save the dataset you created to a **CSV** file called `part2-analytical-dataset.csv`in the top-level folder for this project, so it will be included in git commits and pushed to Github. The **CSV** must follow these requirements: 
	
* There shall be no row index numbers (specifially for Python)
* NA's shall be saved as empty string, not "NA"


### Tasks

1.  **(5 points)** Re-state your question clearly and state why you think it can be answered visually. 
2.  **(10 points)** Create the analytic data set to the specifications above. **You will use R or Python**. The code you use to do the munging will be named `part2-munging.R` or `part2-munging.py` and be saved in the top-level folder of the repo.
3. **(10 points)** Design a static visualization (i.e., a single image) that you believe effectively answers your question, and use the question as the title of your visualization. We recommend that you iterate on your ideas from Part One, but you may also start from scratch and/or draw on inspiration from other sources. Create your final visualization digitally using R or Python . The expectation that this visualization will be refined and of a professional standard, with proper labels, clear legends, and be clearly understandable  independent of your write-up (more details below). You may add thematic personalizations, but they are not required for this homework. 
4.  **(10 points)** Provide a short narrative write-up (approximately 4-5 paragraphs) describing your process and design decisions, and how Part One informed your final visualization. Be clear and descriptive and critical. 
5. **(5 points)** Ensure that all directions are followed, all files are properly named and saved in the right locations, and that all code is reproducible on the graders' computers by using relative paths and preferably using  the `here` (R) or `pyhere` (Python) packages. Additionally, 
    1. Ensure that the  `data/` folder is mentioned in the `.gitignore` file in your repo so that the files in the `data` folder are **not** committed or synced to Github. 
    2. Fill in the `id.yml` file with your information, replacing Prof. Abhijit's information. 



----

The **final deliverable** will include Tasks 1, 3 and 4 and should be in **PDF form** and called `part2-viz.pdf` , and be saved in the top-level folder of the repo. *You may create this document using **RMarkdown, Jupyter Notebooks, Word/Pages or Google Docs***, but **make sure what you deliver is a PDF**. That is the only format that will be accepted. See below for more details about this writeup. 

You **must** also provide the source code for the visualization, that will be named `part2-viz-source.{R,Rmd,py}` depending on the format and language. 

You **cannot** submit the source code as part of a Jupyter notebook (`.ipynb`) file. Instead, you will have to convert it to a Python script (`.py`); one way is by installing **nbconvert** (`conda install -c anaconda nbconvert`) and then following the method described [here](https://www.algorist.co.uk/post/how-to-convert-jupyter-notebooks-to-python-script/).

----

While **you must use the data set given**, you are free to transform the data as necessary. Such transforms may include (but are not limited to) log transformations, computing percentages or averages, grouping elements into new categories, or removing unnecessary variables or records. You are also free to incorporate external data as you see fit, but ***state your sources if you do***. 

**Your chart image should be interpretable without consulting your writeup**. Do not forget to include a title, axis labels or legends as needed!

In your writeup, ***you should provide a rigorous rationale for your design decisions***. As different visualizations can emphasize different aspects of a data set, your writeup should document what aspects of the data you are attempting to most effectively communicate. In short, ***what story are you trying to tell?***

**Document the visual encodings you used and why they are appropriate for the data and your specific question**. These decisions include the choice of visualization (mark) type, size, color, scale, and other visual elements, as well as the use of sorting or other data transformations. How do these decisions facilitate effective communication? Just as important, also note which aspects of the data might be obscured or down-played due to your visualization design.

Your writeup should also include a paragraph reflecting on how Part One may or may not have influenced your design for this assignment. For example, you could discuss to what extent sketching helped inform your final design. What aspects of your Part One sketches did you keep or discard, and why did you make those decisions? Or, how did Part One help you change course for Part Two?

### Assessments

You may use the following rubric for guidance, but it may not translate exactly into particular scores for each component. We will assess your work holistically, as always. We will determine scores by judging the correctness of the final analytic data, the soundness of your design and the quality of the write-up. We will also look for consideration of the audience, message and intended task or story you're trying to convey.

| Component                              | Excellent                                                    | Satisfactory                                                 | Poor                                                         |
| -------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Munging data**                       | The analytic data is a tidy data set fulfilling the specified requirements and amenable to creating your visualization | The analytic data set fulfills the specified requirements, but could be better structured for visualization | The analytic data is incorrect and does not meet the required specifications. |
| **Data Question**                      | An interesting question (ie. one without an obvious answer) is posed, and is answered clearly by the visualization | A reasonable question is posed, but the visualization does not clearly address it | Missing or unclear question posed                            |
| **Mark, encoding and data transforms** | All design choices are effective and defensible. The visualization can be understood effortlessly | Design choices are largely effective, but minor errors hinder comprehension | Ineffective encoding choices are distracting or potentially misleading |
| **Titles & Labels**                    | Titles and labels describe and contextualize the visualization | Most necessary titles and labels are present, but they could provide more context | Many titles and labels are missing, or do not provide useful information |
| **Creativity and Originality**         | You exceeded the parameters of the assignment, with original insights or a particularly engaging design | You met all the parameters of the assignment                 | You met most of the parameters of the assignment             |

Your final repo on Github must follow the instructions and have the required parts mentioned in each part of the homework. This **will be assessed**. As an example of a *minimal* repo you would submit to fulfill the requirements of this homework, we could see the following files and file structure in your repo.

```bash
.
├── data/
├── .gitignore
├── id.yml
├── part1.pdf
├── part2-analytical-dataset.csv
├── part2-munging.py
├── part2-viz.pdf
└── part2-viz-source.py

```

Note that the **only** data file we would see is `part2-analytical-dataset.csv` . We would also allow `png/jpg/pdf/svg` files for your sketches and for the final visualization in Part Two, and any derivative files that are generated if you're using RMarkdown or Jupyter. The repo should be lean, minimalist and have only as many files as required to provide a self-contained and reproducible submission for this homework.