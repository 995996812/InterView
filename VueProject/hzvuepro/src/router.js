import Vue from 'vue'
import Router from 'vue-router'
import Index from './views/Index.vue'
import Channel from './components/Channel'
import Article from './components/Article'
Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'Index',
      component: Index
    },
    {
      path: '/channel',
      name: 'Channel',
      component: Channel
    },
    {
      path: '/article',
      name: 'Article',
      component: Article
    }
  ]
})
