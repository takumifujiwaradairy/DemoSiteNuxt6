<template>
  <div>
    <nuxt-link to="/">一覧に戻る</nuxt-link>
    <h1>編集画面</h1>
    <ul>
      <li>
        <label>記事のID番号</label>
        {{ id }}
      </li>
      <li>
        <label>記事のタイトル</label>
        <textarea v-model="title">
        </textarea>
      </li>
      <li>
        <label>記事の中身</label>
        <textarea v-model="body">
        </textarea>
      </li>
      <li>
        <select v-model="tags" multiple>
          <option v-for="tags in getTags" :key="tags.id" :value="tags.id">
            {{ tags.name }}
          </option>
        </select>
      </li>
      <button @click="edit">編集</button>
    </ul>
  </div>
</template>

<script>
import {  mapActions, mapGetters } from 'vuex';
export default {
  async asyncData({ store, route }) {
    await store.dispatch("fetchArticle", route.params.id);
  },
  data: function() {
    return { 
      id: '',
      title: '',
      body: '',
      tags: []
    }
  },
  methods: {
    edit: function() {
      this.$store.dispatch('editArticle', { id: this.id, title: this.title, body: this.body, tags: this.tags } );
      this.$router.push("/");
    }
  },
  created () {
    this.id = this.getArticle.id,
    this.title = this.getArticle.title,
    this.body = this.getArticle.body,
    this.tags = this.getArticle.tags
  },
  computed: {
    ...mapGetters(['getArticle', 'getTags']),
  }
}
</script>

<style>

</style>