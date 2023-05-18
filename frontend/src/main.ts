import { createApp } from 'vue'
import App from './App.vue'
import store from './global/store'

const fend = createApp(App);
fend.use(store);
fend.config.globalProperties.$store = store
fend.mount('#app');
