#! /bin/bash

pasta=( "/publico" "/adm" "/venda" "/secretaria")
grupo=( "GRP_ADM" "GPR_VEN" "GPR_SEC")
usuario=("carlos" "maria" "joao" "debora" "sebastiana" "roberto" "josefina" "amanda" "rogerio")

echo "Criando os diretório diretorios"
for i in ${pasta[@]} # loop varrendo uma lista
do 
    mkdir .$i
    printf "%s \n" "$i"
done

echo "Criando os grupos de usuários"
for i in ${grupo[@]} # loop varrendo uma lista
do 
    groupadd $i
    printf "%s \n" "$i"
done


echo "Criando usuários e adicionando aos grupos"
k=0
for i in ${grupo[@]} #loop varrendo uma lista
do 
  for ((j=0;j<=2;j++))
  do
     useradd ${usuario[$k]} -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G $i
     printf "%s --->%s \n" "${usuario[$k]}" "$i"
     ((k++))
  done
done

echo "Especificando permissões dos diretório ..."

for ((j=0;j<=2;j++))
do
   chown root:${grupo[$j]} .${pasta[$(($j+1))]}  
   chmod 770 .${pasta[$(($j+1))]}  
done
chmod 777 ./publico

echo "Fim .."












