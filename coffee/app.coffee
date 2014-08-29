class window.App
  constructor: ->
    @scene = new THREE.Scene()
    @renderer = new THREE.WebGLRenderer()
    @renderer.setSize window.innerWidth, window.innerHeight
    @renderer.shadowMapEnabled = yes
    document.body.appendChild @renderer.domElement
<<<<<<< HEAD
=======
    document.getElementById('warning').remove()
>>>>>>> gh-pages

    @camera = new THREE.PerspectiveCamera 45, window.innerWidth / window.innerHeight, 0.1, 1000

    @camera.position.x = -2
    @camera.position.y = 0
    @camera.position.z = 0
    @camera.lookAt @scene.position

    @settings = new ->
      shader_speed: 0.5
      z_rotation_speed: 0.001
      y_rotation_speed: 0.001
      x_rotation_speed: 0.001
      fog_density: 0.45

    gui = new dat.GUI()
    gui.add @settings, 'shader_speed', 0, 1
    gui.add @settings, 'z_rotation_speed', 0, 0.1
    gui.add @settings, 'y_rotation_speed', 0, 0.1
    gui.add @settings, 'x_rotation_speed', 0, 0.1
    gui.add @settings, 'fog_density', 0, 1

    @init_stats()

    bg = new THREE.SphereGeometry 0.5, 50, 50, 30
    
    @uniforms =
      fog_color:
        type: 'v3'
        value: THREE.Vector3(1, 1, 0)
      fog_density:
        type: 'f'
        value: 0.45
      time:
        type: 'f'
        value: 0
      texture1:
        type: 't'
        value: THREE.ImageUtils.loadTexture( "images/lavatile.jpg" )
      texture2:
        type: 't'
        value: THREE.ImageUtils.loadTexture( "images/cloud.png" )
    @uniforms.texture1.value.wrapS = @uniforms.texture1.value.wrapT = THREE.RepeatWrapping
    @uniforms.texture2.value.wrapS = @uniforms.texture2.value.wrapT = THREE.RepeatWrapping

    @clock = new THREE.Clock();
    shaderMaterial = new THREE.ShaderMaterial
      uniforms: @uniforms
      vertexShader: document.getElementById('cubeVertexShader').textContent
      fragmentShader: document.getElementById('cubeFragmentShader').textContent

    @blah = new THREE.Mesh bg, shaderMaterial, 0
    @blah.rotation.x = 1;
    @blah.rotation.z = 1;
    @blah.rotation.y = 0.5;
    @scene.add @blah

    @animate()

  init_stats: ->
    @stats = new Stats()
    @stats.setMode 0
    @stats.domElement.style.position = 'absolute'
    @stats.domElement.style.left = '0px'
    @stats.domElement.style.top = '0px'
    console.log @stats.domElement
<<<<<<< HEAD
    document.getElementById('stats').innerHTML = @stats.domElement.innerHTML
=======
    document.getElementById('stats').appendChild @stats.domElement
>>>>>>> gh-pages


  render: =>
    @stats.update()
    @renderer.render @scene, @camera

  animate: =>
    @uniforms.time.value += (@clock.getDelta()*5)*@settings.shader_speed;
    @uniforms.fog_density.value = @settings.fog_density
    @blah.rotation.z += @settings.z_rotation_speed
    @blah.rotation.y += @settings.y_rotation_speed
    @blah.rotation.x += @settings.x_rotation_speed

    requestAnimationFrame(@animate)
    @render()