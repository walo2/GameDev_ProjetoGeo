extends Node

var rng = RandomNumberGenerator.new()

#1 - Início receba o valor equivalente determinado pelo sorteio
func t1_inicio():
	#Determina quais players são diamante e quais são ferro
	if (GlobalData.flag_caminho == false):
		var players = []
		players.resize(GlobalData.num_players)
		for i in players.size():
			players[i] = i
		players.shuffle()
		
		for i in players.size():
			if (i%2==0):
				GlobalData.caminho[players[i]] = 1 #Diamante
				GlobalData.player_money[players[i]] = 1000 * i
				print("Jogador ", players[i], "é Diamante, saldo = ", GlobalData.player_money[players[i]])
			else:
				GlobalData.caminho[players[i]] = 2 #Ferro
				GlobalData.player_money[players[i]] = 1000 * i
				print("Jogador ", players[i], "é Ferro, saldo = ", GlobalData.player_money[players[i]])
		
		GlobalData.flag_caminho = true
		

#2 - Venda da força de trabalho- Os jogadores 1 e 3- receberão 300$, Os jogadores 2 e 4 - receberão 200$. 
func t2_forca_de_trabalho(playerId):
	if (GlobalData.caminho[playerId] == 1): #Diamante
		GlobalData.player_money[playerId] += 300
	else: #Ferro
		GlobalData.player_money[playerId] += 200

#3, 8, 12 - Carta sorte ou revés. (quadro sorte revés)
func t_sorte_ou_reves(playerId, num_sorteado):
	#Determina se vai ser sorte ou revés
	var sorte = rng.randi_range(0,1)
	if (sorte == 0): #sorte
		if (num_sorteado == 1): #Consultoria de geoprocessamento
			GlobalData.player_money[playerId] += 200
		elif (num_sorteado == 2): #Demissão sem justa causa - indenização trabalhista
			GlobalData.player_money[playerId] += 500
		elif (num_sorteado == 3): #Valorização de suas ações na bolsa
			GlobalData.player_money[playerId] += 200
		else: #Loteria do trabalhador
			GlobalData.player_money[playerId] += 300
	
	else: #revés
		if (num_sorteado == 1): #Foi entregar ifood e a moto quebrou
			GlobalData.player_money[playerId] -= 200
		elif (num_sorteado == 2): #Você foi convidado a investir em bitcoin. Ocorreu uma desvalorização repentina da moeda virtual devido a sua volatilidade
			GlobalData.player_money[playerId] -= 200
		elif (num_sorteado == 3): #Realizou um empréstimo bancário para pagar dívidas, porém houve atraso no pagamento e cobrança de juros
			GlobalData.player_money[playerId] -= 100
		else: #Desvalorização de suas ações na bolsa
			GlobalData.player_money[playerId] -= 200

#4 - Comprar casa
func t4_comprar_casa(playerId):
	if (GlobalData.caminho[playerId] == 1): #Diamante
		GlobalData.player_money[playerId] -= 5000
	else: #Ferro
		GlobalData.player_money[playerId] -= 1500
	
#5 - Perguntas e respostas
func t5_perguntas(playerId):
	pass
	
#6 - Formação Educacional Contínua
func t6_formacao(playerId):
	if (GlobalData.caminho[playerId] == 1): #Diamante
		GlobalData.player_money[playerId] -= 200
	else: #Ferro
		GlobalData.player_money[playerId] += 50

#7 - Feira semanal
func t7_feira(playerId):
	if (GlobalData.caminho[playerId] == 1): #Diamante
		GlobalData.player_money[playerId] -= 250
	else: #Ferro
		GlobalData.player_money[playerId] += 150

#9 - Investimento na agricultura familiar
func t9_agricultura(playerId):
	if (GlobalData.caminho[playerId] == 1): #Diamante
		GlobalData.player_money[playerId] -= 200
	else:
		GlobalData.player_money[playerId] += 50

#10 - Contratação de servico de saúde
func t10_plano_de_saude(playerId):
	if (GlobalData.caminho[playerId] == 1): #Diamante
		GlobalData.player_money[playerId] -= 200
	#Ferro não ganha nem perde nesta casa

#11 - Taxação de fortunas
func t11_grandes_fortunas(playerId):
	if (GlobalData.caminho[playerId] == 1): #Diamante
		GlobalData.player_money[playerId] -= int(0.2 * GlobalData.player_money[playerId])
	else: #Ferro
		GlobalData.player_money[playerId] -= int(0.1 * GlobalData.player_money[playerId])

#13 - Renda básica universal
func t13_renda_basica(playerId):
	GlobalData.player_money[playerId] += 400

#14 - Recuperação ambiental
func t14_recuperacao_ambiental(playerId):
	GlobalData.player_money[playerId] -= 200

#15 - Férias
func t15_ferias(playerId):
	GlobalData.player_money[playerId] += 100
	
