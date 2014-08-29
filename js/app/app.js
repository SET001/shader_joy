// Generated by CoffeeScript 1.6.3
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  window.App = (function() {
    function App() {
      this.animate = __bind(this.animate, this);
      this.render = __bind(this.render, this);
      var bg, gui, shaderMaterial;
      this.scene = new THREE.Scene();
      this.renderer = new THREE.WebGLRenderer();
      this.renderer.setSize(window.innerWidth, window.innerHeight);
      this.renderer.shadowMapEnabled = true;
      document.body.appendChild(this.renderer.domElement);
<<<<<<< HEAD
=======
      document.getElementById('warning').remove();
>>>>>>> gh-pages
      this.camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.1, 1000);
      this.camera.position.x = -2;
      this.camera.position.y = 0;
      this.camera.position.z = 0;
      this.camera.lookAt(this.scene.position);
      this.settings = new function() {
        return {
          shader_speed: 0.5,
          z_rotation_speed: 0.001,
          y_rotation_speed: 0.001,
          x_rotation_speed: 0.001,
          fog_density: 0.45
        };
      };
      gui = new dat.GUI();
      gui.add(this.settings, 'shader_speed', 0, 1);
      gui.add(this.settings, 'z_rotation_speed', 0, 0.1);
      gui.add(this.settings, 'y_rotation_speed', 0, 0.1);
      gui.add(this.settings, 'x_rotation_speed', 0, 0.1);
      gui.add(this.settings, 'fog_density', 0, 1);
      this.init_stats();
      bg = new THREE.SphereGeometry(0.5, 50, 50, 30);
      this.uniforms = {
        fog_color: {
          type: 'v3',
          value: THREE.Vector3(1, 1, 0)
        },
        fog_density: {
          type: 'f',
          value: 0.45
        },
        time: {
          type: 'f',
          value: 0
        },
        texture1: {
          type: 't',
          value: THREE.ImageUtils.loadTexture("images/lavatile.jpg")
        },
        texture2: {
          type: 't',
          value: THREE.ImageUtils.loadTexture("images/cloud.png")
        }
      };
      this.uniforms.texture1.value.wrapS = this.uniforms.texture1.value.wrapT = THREE.RepeatWrapping;
      this.uniforms.texture2.value.wrapS = this.uniforms.texture2.value.wrapT = THREE.RepeatWrapping;
      this.clock = new THREE.Clock();
      shaderMaterial = new THREE.ShaderMaterial({
        uniforms: this.uniforms,
        vertexShader: document.getElementById('cubeVertexShader').textContent,
        fragmentShader: document.getElementById('cubeFragmentShader').textContent
      });
      this.blah = new THREE.Mesh(bg, shaderMaterial, 0);
      this.blah.rotation.x = 1;
      this.blah.rotation.z = 1;
      this.blah.rotation.y = 0.5;
      this.scene.add(this.blah);
      this.animate();
    }

    App.prototype.init_stats = function() {
      this.stats = new Stats();
      this.stats.setMode(0);
      this.stats.domElement.style.position = 'absolute';
      this.stats.domElement.style.left = '0px';
      this.stats.domElement.style.top = '0px';
      console.log(this.stats.domElement);
<<<<<<< HEAD
      return document.getElementById('stats').innerHTML = this.stats.domElement.innerHTML;
=======
      return document.getElementById('stats').appendChild(this.stats.domElement);
>>>>>>> gh-pages
    };

    App.prototype.render = function() {
      this.stats.update();
      return this.renderer.render(this.scene, this.camera);
    };

    App.prototype.animate = function() {
      this.uniforms.time.value += (this.clock.getDelta() * 5) * this.settings.shader_speed;
      this.uniforms.fog_density.value = this.settings.fog_density;
      this.blah.rotation.z += this.settings.z_rotation_speed;
      this.blah.rotation.y += this.settings.y_rotation_speed;
      this.blah.rotation.x += this.settings.x_rotation_speed;
      requestAnimationFrame(this.animate);
      return this.render();
    };

    return App;

  })();

}).call(this);
