import jenkins.model.Jenkins

// Get the jenkins instance
def instance = Jenkins.getInstance()

// Do the configuration
//instance.setNumExecutors(0)

// Save the configuration
instance.save()
