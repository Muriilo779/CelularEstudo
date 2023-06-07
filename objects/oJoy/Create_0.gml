/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
vel = 0; 
dir = 0;
fazer = false;

movimentoDraw = function ()
{
	//Se eu nao tiver um alvo
	if(!alvo) exit;

	var x1 = device_mouse_x_to_gui(0);
	var y1 = device_mouse_y_to_gui(0);

	var sobre = point_in_circle(x1, y1, x, y, sprite_width / 2);
	var _cor = c_white
	var toque = device_mouse_check_button(0, mb_left);


	if(sobre || fazer == true)
	{
		_cor = c_red;
	
	}
	if(toque)
	{
		_cor = c_yellow;
		//Sempre que a pessoa tocou e segurou o fazer será igual a true
		fazer = true;
	
		//Pegando a distancia do meu centro ate o mouse 
		var distancia = point_distance(x, y, x1, y1);
		vel = min(distancia, sprite_width / 2);
		dir = point_direction(x, y, x1, y1);
	}
	else
	{
		fazer = false;
	
		//Zerando a velocidade
		vel = lerp(vel, 0, 0.1);
	
	}
	//Me desenhando 
	draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, _cor, 0.5);

	//Definido a posicao da bolinha 

	var xx = lengthdir_x(vel, dir);
	var yy = lengthdir_y(vel, dir);

	//Desenhando a bolinha do joystick 
	var xEscalaMenor = image_xscale / 4, yEscalaMenor = image_yscale / 4;

	draw_sprite_ext(sprite_index, 0, x + xx, y + yy, xEscalaMenor, yEscalaMenor, 0,_cor, 1);
}

movimentoStep = function()
{
	//Checando se o alvo existe
	if(!alvo) exit;
	
	//Checando se o alvo não existe
	if(!instance_exists(alvo)) exit;
	
	//Se o alvo existir
	var velX = lengthdir_x(vel, dir);
	var velY = lengthdir_y(vel, dir);
	
	var velH = round((velX / sprite_width * 2) * velocidadeMax);
	var velV = round((velY/ sprite_height * 2) * velocidadeMax);
	
	alvo.x += velH;
	alvo.y += velV;
	
}