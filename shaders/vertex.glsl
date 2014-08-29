attribute float displacement;
attribute float colors;

varying vec3 vNormal;
varying float color;

void main() {

  vNormal = normal;
  color = colors;
  // push the displacement into the
  // three slots of a 3D vector so
  // it can be used in operations
  // with other 3D vectors like
  // positions and normals
  // vec3 newPosition = position + normal * vec3(displacement);
  // gl_Position = projectionMatrix * modelViewMatrix * vec4(newPosition,1.0);
  vec4 mvPosition = modelViewMatrix * vec4( position, 1.0 );
  gl_Position = projectionMatrix * mvPosition;
}