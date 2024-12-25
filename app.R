# Load necessary libraries
library(shiny)

# Define the UI
ui <- fluidPage(
  
  # App title
  titlePanel("Simple Quiz App"),
  
  # Display questions and options
  fluidRow(
    column(12,
           h4("1. What is the capital of France?"),
           radioButtons("q1", "Choose one:",
                        choices = c("Berlin", "Madrid", "Paris", "Rome")),
           
           h4("2. Which planet is known as the Red Planet?"),
           radioButtons("q2", "Choose one:",
                        choices = c("Earth", "Mars", "Jupiter", "Saturn")),
           
           h4("3. What is the largest mammal?"),
           radioButtons("q3", "Choose one:",
                        choices = c("Elephant", "Blue Whale", "Giraffe", "Shark")),
           
           h4("4. How many continents are there?"),
           radioButtons("q4", "Choose one:",
                        choices = c("5", "6", "7", "8")),
           
           # Submit button
           actionButton("submit", "Submit Quiz"),
           br(),
           br(),
           # Text output for score
           textOutput("result")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  
  # Correct answers for the quiz
  correct_answers <- c(q1 = "Paris", q2 = "Mars", q3 = "Blue Whale", q4 = "7")
  
  # Reactive event for when the Submit button is clicked
  observeEvent(input$submit, {
    # User's answers
    user_answers <- c(input$q1, input$q2, input$q3, input$q4)
    
    # Calculate score
    score <- sum(user_answers == correct_answers)
    
    # Display score
    output$result <- renderText({
      paste("You scored", score, "out of", length(correct_answers), "correct!")
    })
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
