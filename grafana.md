Como fizemos a implementação do grafana utilizando o power shell

primeiro fizemos a instalação dentro da nossa VM e reiniciamos o vscode.

winget install grafana

depois criamos uma pasta chamada testes e colocamos dentro dela nosso arquivo de teste.js
    import http from 'k6/http';
    import { sleep } from 'k6';
    import { Trend } from 'k6/metrics';

    let tempoDeResposta = new Trend("Tempo de resposta");

    export default function () {
        let res = http.get("http://localhost:5000");
        tempoDeResposta.add(res.timings.duration);
        sleep(1);
    }

e para rodar esse script com o graffana temos de entrar na pasta testes.
    cd testes

    e rodar o comando 

    k6 run teste.js


simulando a carga de 100 usuarios simultaneos
k6 run --vus 100 --duration 30s --out influxdb=http://localhost:8086 teste.js

Simule 500 usuários por 2 minutos
k6 run --vus 500 --duration 2m --out influxdb=http://localhost:8086 teste.js
