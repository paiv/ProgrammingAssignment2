library("RUnit")
source("cachematrix.R")

test.suite <- defineTestSuite('cachematrix', file.path('.'))
test.result <- runTestSuite(test.suite)

printTextProtocol(test.result)
