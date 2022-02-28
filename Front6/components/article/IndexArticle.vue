<template>
  <div>
    <div>
      <h1>検索</h1>
      <input v-model="query.title_cont">
      <select v-model="query.tags_id_in" multiple>
        <option v-for="searchTag in getTags" :key="searchTag.id" :value="searchTag.id">
          {{ searchTag.name }}
        </option>
      </select>
      <button @click="search">検索</button>
    </div>
    <h1>一覧</h1>
    <ul v-for="article in getArticles" :key="`third-${article.id}`">
      <li>
        <label>記事のid</label>
        <p>{{ article.id }}</p>
      </li>
      <div v-if="isEdit">
        <li>
          <label>タイトル</label>
          <p>{{ article.title }}</p>
        </li>
        <li>
          <label>中身</label>
          <p>{{ article.body }}</p>
        </li>
      </div>
      <div v-else>
        <li>
          <label>タイトル</label>
          <textarea v-model="article.title"></textarea>
        </li>
        <li>
          <label>中身</label>
          <textarea v-model="article.body"></textarea>
        </li>
      </div>
      <button @click="startEdit(isEdit)">{{ isEdit? '編集':'キャンセル'}}</button>
      <button @click="edit(article)">編集を送信</button>
      <li>
        <label>likeの合計</label>
        <p>{{ article.likes_count }}</p>
      </li>
      <li class="tag-list" v-for="tag in article.tags" :key="`forth-${tag.id}`">
        <label>tag</label>
        <p>{{ tag.name }}</p>
      </li>
      <delete-article :id="article.id"/>
      <add-like :id="article.id" :is_like="article.is_like"/>
      <nuxt-link :to="`/article/${article.id}`">詳細ページ</nuxt-link>
      <nuxt-link :to="`/edit/${article.id}`">編集ページ</nuxt-link>
    </ul>
  </div> 
</template>

<script>
import { mapActions,mapGetters } from 'vuex';
import DeleteArticle from './DeleteArticle.vue';
import AddLike from './AddLike.vue';
import axios from "axios";
import Qs from "qs";

export default {
  data() {
    return {
      isEdit: true,
      query: {
        title_cont: "",
        tags_id_in: [],
      },
    };
  },
  components: {
    DeleteArticle,
    AddLike
  },
  computed: {
    ...mapGetters(['getArticles', 'getTags'])
  },
  methods: {
    ...mapActions(['fetchArticles']),
    search() {
      axios.get("/api/articles",
      { params: { q: this.query }, 
        paramsSerializer(params) {
          return Qs.stringify(params, { arrayFormat: "brackets" })
        }
      })
      .then((response) => {
        this.$store.commit("setArticles", response.data);
      })
    },
    edit(article) {
      this.$store.dispatch('editArticle', { id: article.id ,title: article.title, body: article.body } );
    },
    startEdit(isEdit) { 
      if(isEdit) {
        this.isEdit = false
      } else {
        this.isEdit = true
      }
    }
  },
  created () {
    this.fetchArticles()
  }
}
</script>

<style>

</style>