<template>
  <div>
    <nuxt-link to="/">一覧に戻る</nuxt-link>
    <h1>詳細画面</h1>
    <ul>
      <li>
        <label>記事のID番号</label>
        {{ getArticle.id }}
      </li>
      <li>
        <label>記事のタイトル</label>
        {{ getArticle.title }}
      </li>
      <li>
        <label>記事の中身</label>
        {{ getArticle.body }}
      </li>
    </ul>
  </div>
</template>

<script>
import {  mapActions, mapGetters } from 'vuex';
export default {
  // 詳細画面を取ってくるためにindex.jsにactionを定義する  
  async asyncData({ store, route }) {
    await store.dispatch("fetchArticle", route.params.id);
  },
  computed: {
    // stateの中身を取って来る。
    ...mapGetters(['getArticle']),
  }
}
</script>

<style>

</style>