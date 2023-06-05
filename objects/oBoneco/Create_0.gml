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
		
		x+= xAtual + _xdif;
	}
	
	
}
