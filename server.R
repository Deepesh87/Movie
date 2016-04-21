shinyServer(function(input, output) {
  movies<- read.csv("Movies_final.csv")
output$table=renderDataTable({
all=select(movies,Movie,Genre,Subgenre,Director,Leadactor,Supporting.Actor,Rediff_Rating)
all
})

output$latest=renderDataTable({
now=movies[1:5,c("Movie","Genre","Subgenre","Director","Leadactor","Rediff_Rating")]
now
})

output$plot1=renderPlot({
ggplot(movies,aes(x=movies$MovieCost,y=movies$Boxofficecollection,color=Actorclass))+geom_point()+xlab("Movie cost in crores")+ylab("Movie Box office collection in crores")+stat_smooth(method="lm",se=F)
  })

output$plot2=renderPlot({
ggplot(movies,aes(x=movies$MovieCost,y=movies$Boxofficecollection,color=Directorclass))+geom_point()+xlab("Movie cost in crores")+ylab("Movie Box office collection in crores")+stat_smooth(method="lm",se=F)
})
})