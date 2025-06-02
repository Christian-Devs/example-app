let login = require('./components/auth/LoginView.vue').default;
let home = require('./components/home.vue').default;
let logout = require('./components/auth/LogoutView.vue').default;
let addclient = require('./components/AddClientView.vue').default;

export const routes = [
    { path: '/', component: login, name: '/' },
    { path: '/logout', component: logout, name: 'logout' },
    { path: '/home', component: home, name: 'home' },
    { path: '/add-client', component: addclient, name: 'add-client' },
];