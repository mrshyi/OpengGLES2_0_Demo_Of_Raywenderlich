attribute vec4 Position; // 1
attribute vec4 SourceColor; // 2

varying vec4 DestinationColor; // 3 out the value  that will be passed to frament shader

void main(void) { // 4
    DestinationColor = SourceColor; // 5
    gl_Position = Position; // 6
}