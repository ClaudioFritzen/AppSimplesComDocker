import http from 'k6/http';
import { sleep } from 'k6';

export default function () {
    let res = http.get('http://localhost:5000');
    console.log(`Resposta: ${res.body}`);
    sleep(1);
}
