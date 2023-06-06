/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Se eu nao tiver um alvo
if(!alvo) exit;

var x1 = device_mouse_x_to_gui(0);
var y1 = device_mouse_y_to_gui(0);

var sobre = point_in_circle(x1, y1, x, y, sprite_width / 2);
var _cor = c_white
var toque = device_mouse_check_button(0, mb_left);


if(sobre) _cor = c_red;

if(toque)
{
	//Pegando a distancia do meu centro ate o mouse 
	var distancia = point_distance(x, y, x1, y1);
	vel = min(distancia, sprite_width / 2);
	dir = point_direction(x, y, x1, y1);
}
//Me desenhando 
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, _cor, 0.5);

//Definido a posicao da bolinha 

var xx = lengthdir_x(vel, dir);
var yy = lengthdir_y(vel, dir);

//Desenhando a bolinha do joystick 
var xEscalaMenor = image_xscale / 4, yEscalaMenor = image_yscale / 4;

draw_sprite_ext(sprite_index, 0, x + xx, y + yy, xEscalaMenor, yEscalaMenor, 0,_cor, 1);
