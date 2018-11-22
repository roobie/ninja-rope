let project = new Project('New Project')

project.addAssets('Assets/**')

project.addShaders('Shaders/**')

project.addSources('Sources')

project.addLibrary('actuate')
project.addLibrary('box2d')

resolve(project)
