# Part two: White Hat/Black Hat Visualizations

> Understanding is a three edged sword: your side, their side, and the truth
> -- J. Michael Straczynski, Babylon 5

Data is increasingly a driving force in political, societal and personal decision-making, and data reporting and data journalism increasingly influence our worldview. It is tempting to think of data and data visualizations as neutral and just "representing the data", but is that indeed the case? Much can depend on perspective, cultural context, and innate biases both of those creating visualizations and those consuming them.

In this section, you will take a data set and create two visualizations that reflect differing perspectives on the data, a "white hat" perspective and a "black hat" perspective. To reflect on these terms, a _white hat hacker_ uses their skills for good, whereas a _black hat hacker_ uses their skills for their own, or their organizations, gain. A further development of these terms might be as follows.

A _white hat visualization_ would be one where:

- The visualizations are clear and easy to interpret for the intended audience (often the general population);
- Any transformations, filtering, and computations done to the data are clearly and transparently communicated; and
- The sources of the data, including potential bias, is communicated.

A _black hat visualization_, on the other hand, might have the following characteristics:

- The visual representation is intentionally inappropriate, overly complex and/or too cluttered for the audience;
- Labels, axes, and legends are misleading;
- Titles are skewed to intentionally influence the viewer’s perception;
- The data has been transformed, filtered, or processed in an intentionally misleading way; or
- The source and provenance of the data is not clear to the viewer.

Note that **this doesn't mean that black hat visualizations are cartoonish or meme-ish**. On the contrary, such visualizations can be sophisticated, use good design principles, and appear as convincing visualizations. You might need to be a critical reader to appreciate whether a visualization is white hat or black hat. In fact, the sneakier the better!!

Although we might never imagine ourselves to be (nor aspire to be) black hat hackers, we are going to temporarily don this hat to better  appreciate the extent of the rhetorical force of visualization and how it can drive emotions and influence, and  build our critical reading  and diagnostic skills.

## Datasets

For this assignment, you can choose one of 3 data sets, that have been chosen for their perhaps controversial and provocative topics. For such data, **ethical visualization** is especially important. Note that you do not have to visualize the entire dataset (i.e., you may choose a subset of the data to visualize) and that your two  visualizations can focus on different aspects of the data.

1. [Greenhouse gas emissions](https://stats.oecd.org/Index.aspx?DataSetCode=AIR_GHG), 1990-2019. Source: OECD Statistics

2. [The Global Gender Gap Index](https://tcdata360.worldbank.org/indicators/af52ebe9?country=BRA&indicator=27959&viz=line_chart&years=2006,2020), 2006-2020. This index examines the gap between men and women in four areas: political empowerment, economic participation and opportunity, educational attainment, and health and survival. Other indicators are also provided. Source: World Bank

3. [Gentrification and Demographic Analysis](https://github.com/BuzzFeedNews/2020-02-gentrification). This is a dataset compiled by BuzzFeed News to understand  gentrification, or how the character and demographics of neighborhoods  change as more affluent people and business move in and potentially  displace existing residents. The process of data collection, cleaning,  and analysis is well-documented by the BuzzFeed News team, and be sure  to read the [accompanying article](https://www.buzzfeednews.com/article/lamvo/gentrification-maps-white-black-people-neighborhoods) which contains important context and details.

    

## Deliverables

You will be visualizing your dataset from two perspectives: the white hat and black hat. As a result, you will be generating **two static visualizations** – one for each hat. We construe “visualization” broadly (e.g., a single visualization may comprise several small multiple views). You are free  to use any visualization technique. As with prior assignments, you should carefully consider not only visual encoding decisions but also how you might transform your data (e.g.,  calculating new fields; grouping, binning, or aggregating data; log  transforms; etc.), and what annotations and labels might help best  convey the message from a particular perspective.

For each visualization, document your decisions and describe your rationale in a **short write-up** (no more than 4 paragraphs per visualization). Note that subtlety is  part of the rubric for the black hat visualization, which means we will  likely rely heavily on your write-up for grading this visualization in  particular.

Details of what particular files are to be submitted are listed below. **Please read the instructions carefully, particularly with regard to the files required.**

## Submission details

| Tasks                                                        | Points    |
| ------------------------------------------------------------ | --------- |
| The data munging process, i.e., going from raw data to one or two datasets that will be the basis for the visualizations, must be scripted in R or Python (either one) and named `part-2-munging.R` or `part-2-munging.py`.  The resulting analytic dataset(s) should be **tidy**. | 5 points  |
| The output of this munging must be one or two data files. If you use only one final data file for both visualizations, this must be named `part-2-data.*`, where the `*` reflects the format of the file. If you use separate data for the white hat and black hat visualizations, the corresponding data files must be named `white-hat-data.*` and `black-hat-data.*` . Allowed data file formats are CSV, RData, rds, feather, or parquet. **Excel or Numbers or any spreadsheet application is not allowed**. | 5 points  |
| You will develop the two **static**  visualizations, **one in R and one in Python**, and provide the scripts that created the visualizations.These files will be named `white-hat.R` and `black-hat.py`, or `white-hat.py` and `black-hat.R`. Any static visualization package is allowed, as long as it is available to install from CRAN (for R) or using `pip` or `conda` (for Python). Each file will output one visualization in PNG format, named `white-hat-viz.png` and `black-hat-viz.png`. **Regardless of how you create the HTML report (in 4 below), the files specified here must be part of your submission** | 15 points |
| The final deliverable will be a HTML file, which will contain both the two visualizations as well as narrative content as described earlier in the **Deliverables** section. This file will be named `part-2-submission.html`. Beyond the fact that the script files must generate the two visualizations, how the HTML file is generated is up to you. You can use RMarkdown, Jupyter notebooks, Microsoft Word, or straight HTML, or other means. | 5 points  |

## Expectations

The following is a guide regarding our expectations for your work on this task. This is directional and the final specific rubric will be based on this. These expectations are _in addition to_ the general expectations.


| Hat                                                          | Component                                                    | Excellent                                                    | Satisfactory                                                 | Poor                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **White**                                                    |                                                              |                                                              |                                                              |                                                              |
|                                                              | Marks & Encodings                                            | All design choices are effective. The visualization can be read and understood effortlessly. | Design choices are largely effective, but minor errors hinder comprehension. | Ineffective mark or encoding choices are distracting or potentially misleading. |
| Data Transformation                                          | More advanced transformations (e.g., additional calculations,  aggregations) were used to extend the dataset in interesting or useful  ways. | Simple transforms (e.g., sorting, filtering) were primarily used. | The raw dataset was used directly, with little to no additional transformation. |                                                              |
| Titles & Labels                                              | Titles and labels helpfully describe and contextualize the visualization. | Most necessary titles and labels are present, but they could provide more context. | Many titles or labels are missing, or do not provide human-legible information. |                                                              |
| Write-Up                                                     | Your write up is well-crafted and provides reasoned justification for all design choices. | Most design decisions are described, but rationale could be explained at a greater level of detail. | Missing or incomplete. Several design choices are left unexplained. |                                                              |
| **Black**                                                    |                                                              |                                                              |                                                              |                                                              |
|                                                              | Deceptiveness                                                | Visualization is misleading in at least 2 out of these 3 categories: marks/encodings, data transformation, titles/labels. | Visualization is misleading in only 1 of these 3 categories: marks/encodings, data transformation, titles/labels. | No black hat techniques were used.                           |
| Subtlety                                                     | The black-hat techniques used are very subtle and need close study to be identified even by seasoned visualization readers. | The black-hat techniques cannot be detected at first glance but are still somewhat easy to identify. | The black-hat techniques could be immediately identified.    |                                                              |
| Visualization Design (marks, encodings, data transformations, title & labels) | Aspects of the visualization design make it appear interesting and possibly trustworthy. | An acceptable quality of visualization design. However, some aspects do not help convince the reader of its trustworthiness. | Poor quality of visualization design does not convince the  reader that the visualization is trustworthy. E.g., certain elements  such as titles or legends are missing altogether. |                                                              |
| Write-Up                                                     | Your write up is well-crafted and provides reasoned  justification for all design choices, and especially the black-hat  techniques you used. | Most design decisions are described, but rationale could be explained at a greater level of detail. | Missing or incomplete. Several design choices are left unexplained. |                                                              |
| **Either / Both**                                            |                                                              |                                                              |                                                              |                                                              |
|                                                              | Creativity & Originality                                     | You exceeded the parameters of the assignment, with original insights or a particularly engaging design. | You met all the parameters of the assignment.                | You met most of the parameters of the assignment.            |

