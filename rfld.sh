# everdev network add rfld https://rfld-dapp01.ds1.itgold.io
# everdev network default rfld
# everdev network giver rfld 0:063c1878c1b7536f4d608108982364309979dde3e4f35222d89ade2edb96a6bd
#0:1c0274f9230f2a3d11057cf5a6d7db4d67e850ec19851aba39c3e40463dc0bcb msdeployer
#MS contracts
everdev c topup MS.abi.json -a 0:0ebdba19102c64bf3ec7e550d9faa5a58de826cf1dec07e397c4455d4f595f19 -v 1000000000000
everdev c topup MS.abi.json -a 0:15ba7c4420cdab11b73f2fb227206f06fac57ba139bae310847a4f9e29c4f32a -v 1000000000000
everdev c topup MS.abi.json -a 0:57b19aec3b8e057e01b4a75732407adf0fe00ed62004434962632df069d3044b -v 1000000000000

everdev c r MS.abi.json deleteLog -a 0:0ebdba19102c64bf3ec7e550d9faa5a58de826cf1dec07e397c4455d4f595f19
everdev c r MS.abi.json deleteLog -a 0:15ba7c4420cdab11b73f2fb227206f06fac57ba139bae310847a4f9e29c4f32a
everdev c r MS.abi.json deleteLog -a 0:57b19aec3b8e057e01b4a75732407adf0fe00ed62004434962632df069d3044b 

#tonos-cli --url https://rfld-dapp01.ds1.itgold.io call 0:0ebdba19102c64bf3ec7e550d9faa5a58de826cf1dec07e397c4455d4f595f19 mode2 '{"_srcTime":0,"_srcShardNumber":0}' --abi ./MS.abi.json

#MSDeployer  0:7d7fdd81f565bfb8c16a775472e660148e07df6ccac89d78c799a37f291ba418