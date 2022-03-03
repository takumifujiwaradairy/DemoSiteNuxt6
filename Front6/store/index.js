import Vuex from "vuex";
import axios from "axios";

const url = '/api/articles'
const tagUrl = '/api/tags'

const createStore = () => {
  return new Vuex.Store({
    state: () => ({
      articles: [
      ],
      tags: [
      ],
      article: ''
    }),
    getters: {
      getArticles: (state) => {
        return state.articles
      },
      getArticle: (state) => {
        return state.article
      },
      getTags: (state) => {
        return state.tags
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
      },
      async fetchTags({ commit }){
        await axios.get(tagUrl).then( response => {
          commit('setTags', response.data)
        })
      },
      async deleteArticle({ commit }, id){
        await axios.delete(`${url}/${id}`).then(() => {
          commit('deleteArticle', id)
        })
      },
      async addLike({ commit }, id){
        await axios.post(`${url}/${id}/likes`).then( response => {
          commit('addLike', { id: id, count: response.data })
        })
      },
      async deleteLike({ commit }, id){
        await axios.delete(`${url}/${id}/likes`).then( response => {
          commit('deleteLike', { id: id, count: response.data })
        })
      },
      // 詳細画面を取得する用のメソッドを定義する
      async fetchArticle({ commit }, id){
        await axios.get(`${url}/${id}`).then( response => {
          commit('setArticle', response.data)
        })
      }
    },
    mutations: {
      addArticle: (state, article) => state.articles.push(article),
      setArticles: (state, articles) => state.articles = articles ,
      setTags: (state, tags) => state.tags = tags,
      deleteArticle: (state, id) => {
        const index = state.articles.findIndex(article => article.id === id);
        state.articles.splice(index, 1);
      },
      addLike: (state, { id , count }) => {
        const index = state.articles.findIndex(article => article.id === id);
        const article = state.articles[index];
        article.likes_count = count;
        article.is_like = true;
        state.articles.splice(index, 1, article);
      },
      deleteLike: (state, { id , count }) => {
        const index = state.articles.findIndex(article => article.id === id);
        const article = state.articles[index];
        article.likes_count = count;
        article.is_like = false;
        state.articles.splice(index, 1, article);
      },
      // 詳細画面のデータをStoreの中に入れる
      setArticle: (state, article) => state.article = article,
    }
  })
}

export default createStore;