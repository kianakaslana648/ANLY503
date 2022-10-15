// !preview r2d3 data=dat2, d3_version=4
//
// r2d3: https://rstudio.github.io/r2d3
//

var margin = {top: 30, right:40, bottom: 100, left: 70};
var width = 1000 - margin.left -margin.right;
var height = 400 - margin.top - margin.bottom;

var formatDate = d3.timeParse("%Y-%m-%d");

// Defining the axes
var x = d3.scaleTime()
  .domain([formatDate("2006-12-16"), formatDate("2010-11-26")])
  .range([margin.left, width]);

  
svg.append("g")
  .attr("transform", "translate(" + 0 + "," + height + ")")
  .call(d3.axisBottom(x));
y = d3.scaleLinear()
    .range([height, margin.top])
    .domain([0, 5000]);
svg.append("g")
  .attr("transform", "translate("+margin.left + "," + 0 + ")")
  .call(d3.axisLeft(y));
  
// Plotting the time series as a line plot
svg.append("path")
  .datum(data)
  .attr("fill", "none")
  .attr("stroke", "black")
  .attr("stroke-width", 1)
  .attr("d", d3.line()
    .x(function(d) {return x(formatDate(d.Date));})
    .y(function(d) {return y(d.total_power);}));
    
//labels

    

svg.append("text")
  .attr("transform", "translate(" + (width/2) + " ," + (height+margin.left+margin.right) + ")")
  .attr("dx", "1em").style("text-anchor", "middle")
  .style("font-family", "Tahoma, Geneva, sans-serif")
  .style("font-size", "12pt").text("Time");

svg.append("text")
  .attr("transform", "translate(" + 0 + " ," + ((height +margin.top+margin.bottom)/2) + ") rotate(-90)")
  .attr("dy", "1em")
  .style("font-family", "Tahoma, Geneva, sans-serif")
  .style("font-size", "12pt").text("Total Power");

