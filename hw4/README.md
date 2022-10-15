# Assignment: Interactive visualizations

For this assignment, you will explore the issues involved in implementing interactive and animated visualizations. You will build a visualization that enables interactive exploration or storytelling and deploy it on the web.

This assignment has two goals: (1) we want you to gain familiarity implementing interaction and animation techniques for visualizations; (2) we want you to think carefully about the *effectiveness* of specific interaction and animation techniques for your chosen data domain.

Focus on designing a limited yet compelling visualization that enables interactive exploration along a few critical dimensions, and then layer on additional complexity.  A tightly-focused, well-implemented interactive graphic is much preferred to a sprawling design that attempts too much!

> **This is personal work, and not meant to be done in groups. We expect to see individualism in the submissions, including customized themes and presentations, interactions and animations (if you use them)**

> **Please read the instructions carefully, particularly with regard to the files required.**

## Data

This assignment will be based on a subset of the Electricity Consumption and Occupancy (ECO) data set, available [here](https://georgetown.box.com/s/kylbd32l3shrlhyrphkh93nxovtvttsy). This is a Box link, and you will have to sign in with your GU credentials to access the data.

Data from three households are provided, comprising  power consumption overall (from smart meters) and particular plugs/appliances per second over a period of time. For the smart meter data, the primary interest is the variable `powerallphases` which is the sum of real power over all power phases consumed in the household. The plugs data provides appliance-level consumption. 

State clearly the question(s) you want to address with your two graphics. There are many dimensions to explore, so don't necessarily restrict yourself to a time series of a variable, which is obvious. 

## Deliverables

Design **two** interactive graphic (with any necessary animation techniques) to explore or understand a compelling question from one of the data sets above.  In order to determine what subset of the data and which interactive options are most promising, we encourage you to perform additional exploratory analysis. What aspects of the data reveal the most interesting discoveries or stories? Do not feel obligated to try to convey *everything* about the data: focus on a compelling subset.

Your graphic must include interactions and animations that enable exploration or storytelling. Possible techniques include panning, zooming, brushing, details-on-demand (e.g., tooltips), dynamic query filters, and selecting different measures to display. You are free to also consider highlights, annotations, or other narrative features intended to draw attention to particular items of interest and provide additional context.

Implement your graphic save it as HTML files.  Your graphic should not require customized server-side support; you should simply load data from a static data file or public web API. **One graphic should use plotly and the other use altair**. 

You should create a write-up in an **index.html** file and include your graphics as iframes; for example, to include your plotly visualization saved in _plotly.html_ in your **index.html** file, you can use the code like the following template:

```html
<iframe src="plotly.html" width="100%" height="500">
</iframe>
```

which puts the _plotly.html_ in a window covering 100% of the width of your page and a height of 500px. 

Your write-up should include:

+ **The question(s) you're trying to answer with each visualization**. We will consider the nature of the questions and whether you're successful in answering them through your visualizations
+ **A rationale for your design decisions.** How did you choose your particular visual encodings, interaction, and animation techniques? What alternatives did you consider and how did you arrive at your ultimate choices?

Remember to acknowledge all appropriate sources not just in your write-up but also directly on your visualization itself (including the source of your data, and any example visualization you drew inspiration from).

## Submission details

This assignment is an **individual project** and will be submitted via **Github Classroom**

The following components are **required**. 

1. An **index.html** file that contains your write-up as described above and also the visualizations you've created as iframes in the web page.
2. Two script files, named **plotly.{R,py}** and **altair.{R,py}**, one for each of your 2 graphics. You **must** use plotly for one graphic and altair for the other graphic; the file's ending will reflect whether you use the R or Python API. You can use **either API** for this exercise. Note that the graphics have to be saved as **HTML** files in order to include in your web page, to be named **plotly.html** and **altair.html** according to which framework you use for each graphic.
2. Fill in the **id.yml** file with your personal information
2. Blank required files are included in the repo. Delete the ones you will not use; for example delete plotly.R and altair.R if you're using Python for your homework. For the rest, overwrite them with your own work.

As usual, **we will accept the last commit in your repository** as your submission. This commit will determine whether you are late (after the due date but before the deadline). We do expect git to be used well, i.e., multiple commits as you progress through the homework so that small improvements are version-controlled. Also, all script files (R, py) should be properly formatted and styled using tools introduced in A3.

## Grading

All the requirements of this assignment must be met in order to get a B or high B grade. *This includes files and file names specified above*. 

Going beyond the call of duty can net additional points, for example:

+ advanced interaction or animation techniques
+ novel visualization elements
+ effective multi-view coordination
+ thoughtful and elegant graphic design
+ insightful & engaging exploration or narrative experience

Point deductions will be made when projects suffer from:

+ errors or broken features
+ clearly ineffective visual encodings or poor visual design
+ lack of exploratory or narrative interaction or animation techniques
+ overly simplistic or distracting interaction or animation techniques
+ confusing interface design
+ incomplete or insufficient write-up
