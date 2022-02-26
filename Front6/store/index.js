import Vuex from "vuex";
import axios from "axios";

const url = '/api/articles'

const createStore = () => {
  return new Vuex.Store({
    state: () => ({
      articles: [
      ]
    }),
    getters: {
      getArticles: (state) => {
        return state.articles
      }
    },
    actions: {
      async addArticle({ commit }, article){
        await axios.post(url, article).then( response => {
          commit('addArticle', response.data)
        })
      },
      async fetchArticles({ commit }){
        await axios.get(url).then( response => {
          commit('setArticles', response.data)
        })
      }
    },
    mutations: {
      addArticle: (state, article) => state.articles.push(article),
      setArticles: (state, articles) => state.articles = articles 
    }
  })
}

export default createStore;