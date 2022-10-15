// !preview r2d3 data=sales_CA, d3_version=4
//
// r2d3: https://rstudio.github.io/r2d3
//

var margin = {top: 30, right:40, bottom: 100, left: 40},
  width = 450 - margin.left -margin.right,
  height = 400 - margin.top - margin.bottom;

var formatDate = d3.timeParse("%Y-%m-%d");

// Defining the axes
var x = d3.scaleTime()
  .domain([formatDate("2009-11-01"), formatDate("2012-01-31")])
  .range([margin.left, width]);
svg.append("g")
  .attr("transform", "translate(" + 0 + "," + height + ")")
  .call(d3.axisBottom(x));
y = d3.scaleLinear()
    .range([height, margin.top])
    .domain([0, 10000]);
svg.append("g")
  .attr("transform", "translate("+margin.left + "," + 0 + ")")
  .call(d3.axisLeft(y));

// Plotting the time series as a line plot
svg.append("path")
  .datum(data)
  .attr("fill", "none")
  .attr("stroke", "blue")
  .attr("stroke-width", 1)
  .attr("d", d3.line()
    .x(function(d) {return x(formatDate(d.date));})
    .y(function(d) {return y(d.sales);}))
    
// labels
//svg.append("text")
//  .attr("transform", "translate(" + (width/2) + " ," + (height+2*margin) + ")")
//  .attr("dx", "1em").style("text-anchor", "middle")
//  .style("font-family", "Tahoma, Geneva, sans-serif")
//  .style("font-size", "12pt").text("Time");
//svg.append("text")
//  .attr("transform", "translate(" + 0 + " ," + ((height +2 * margin)/2) + ") rotate(-90)")
//  .attr("dy", "1em")
//  .style("font-family", "Tahoma, Geneva, sans-serif")
//  .style("font-size", "12pt").text("Sales");

