import Cocoa
import CreateML

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/briansakhuja/Downloads/twitter-sanders-apple3.csv"))

let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5) //80% training, 20% testing

let sentimentClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")

let evaluationMetrics = sentimentClassifier.evaluation(on: testingData)

let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100

let metadata = MLModelMetadata(author: "Brian Sakhuja", shortDescription: "A model trained to classify the sentiment on tweets.", version: "1.0")

try sentimentClassifier.write(to: URL(fileURLWithPath: "/Users/briansakhuja/Downloads/TweetSentimentClassifier.mlmodel"))

try sentimentClassifier.prediction(from: "very nice")
try sentimentClassifier.prediction(from: "okay")
try sentimentClassifier.prediction(from: "bad")
