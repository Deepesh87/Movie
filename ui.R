library(shiny)
library(ggplot2)
library(splines)
library(scales)
library(lubridate)
library(dplyr)
library(shinydashboard)
library(ggvis)
library(plotly)
library("knitr")

movies<- read.csv("Movies_final.csv")
str(movies)


#******************************************************************************************

dashboardPage( skin="red",
               
               dashboardHeader(title = "Movies"),
               
               dashboardSidebar(
                 sidebarMenu(
                   menuItem("All Movies", tabName = "all", icon = icon("dashboard"), badgeColor = "green"),
                   menuItem("Latest Release", tabName = "running",badgeLabel = "new", icon = icon("calendar")),
                   menuItem("Cost vs Collection", tabName = "Detailed_Study", icon = icon("th")),
                   menuItem("Directors", tabName = "Configure", icon = icon("wrench")),
                   menuItem("Top10", tabName = "top", icon = icon("wrench"))
                   
                 )),
               
               dashboardBody(
                 
                 tabItems(
                   #*****************************************  
                   # first tab content
                   
                   tabItem(
                     tabName = "all",
                     h3(Sys.time()),
                     h2("All movies"),
                     img(src="Capture.PNG",height=500,width=900),
                     br(),
                     dataTableOutput("table"),
                     
br()
                   ),
                   
                   
 #****************************************    
# Second tab content
tabItem(
tabName = "running",              
dataTableOutput("latest")
), 
#**********************************

# third tab content
tabItem(
  tabName = "Detailed_Study", 
  selectInput("sel","Select a variable to color by",c("Directorclass","Actorclass"),"Directorclass"),
  plotOutput("plot1"),
  plotOutput("plot2")
  
)
#**********************************

                 )   
               )
)
