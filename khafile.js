let project = new Project('Ninja rope')

project.addAssets('Assets/**')

project.addShaders('Shaders/**')

project.addSources('Sources')

project.addLibrary('actuate')
project.addLibrary('box2d')

resolve(project)
