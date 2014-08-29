varying vec3 vNormal;
varying float color;
varying float ii;
uniform float rand[5];
uniform float time;
void main() {
  vec3 light = vec3(0.0, 00.1, 0.01);
  float c;
  // ensure it's normalized
  light = normalize(light);

  // calculate the dot product of
  // the light to the vertex normal
  float dProd = max(0.01,dot(vNormal, light));

  c = color+sin(time)+0.2;
  gl_FragColor = vec4(color, color, color, 0.1);

}