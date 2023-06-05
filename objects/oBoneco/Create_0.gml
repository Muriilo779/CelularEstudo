/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Criando um metodo de clique duplo sem utilizar gestures 

toqueDuplo = function () 
{
	var toqueDuplo = device_mouse_check_button_pressed(0, mb_right)	;
	
	if(toqueDuplo)
	{
		show_message_async("Testando o toque duplo na tela");
	}
}

//Criando um metodo de arrastar sem utilizar gestures 

arrastando = function () 
{
	
	static xInicio = 0, meuX = 0;
	var xAtual = 0;
	
	//Salvando a posicao que a pessoa comecou a tocar na tela
	if(device_mouse_check_button_pressed(0, mb_left))
	{
		//Salvando a posicao incial do meu x	
		xInicio = device_mouse_x(0);
		meuX = x;
		
	}
	//Checando onde o player esta arrastando
	if(device_mouse_check_button(0, mb_left))
	{
		//Salvando a posicao atual do meu clique x 
		xAtual = device_mouse_x(0);
		
		//Sabendo a diferenca entre a posicao atual e inicial
		var _xdif = meuX - xInicio;
		
		x = xAtual + _xdif;
	}
	
	
}

//Criando um metodo de pinch in / out sem utilizar gestures 
mudaEscala = function ()
{
	var toque2 = device_mouse_check_button(1, mb_left);
	static distanciaInicial = 0;
	static distanciaAtual = 0;
	static escala = image_xscale;
	//Se eu toquei com o segundo dedo
	if(toque2)
	{
		//salvar a posição do toque 1 e do toque 2
		//Pegando o x e o y dos toques
		var x1 = device_mouse_x(0), x2 = device_mouse_x(1);
		var y1 = device_mouse_y(0), y2 = device_mouse_y(1);
		
		//minha distância atual é a diferença entre o segundo toque e o primeiro toque
		distanciaAtual = point_distance(x1, y1, x2, y2);
		
		//Checando se a distância  inicial ainda não foi definida
		if(distanciaInicial == 0)
		{
			distanciaInicial = point_distance(x1, y1, x2, y2);
		}
		//var distanciaTotal = distanciaAtual - distanciaInicial;
		//Mudando a escala com base no espaço dos dedos
		//Convertendo a distância atual para um valor relativo a distância inicial
		var distancia = (distanciaAtual / distanciaInicial) * escala;	
		//Deixando proporcional
		image_xscale = distancia;
		image_yscale = image_xscale;
	}
	else //Se eu não estou com o segundo dedo na tela
	{
		//Eu reseto a distância	incial
		distanciaInicial = 0;
		//Atualizandol a minha escala 
		escala = image_xscale;
	}
	
}
