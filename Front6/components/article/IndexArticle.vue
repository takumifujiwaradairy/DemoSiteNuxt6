<template>
  <div>
    <h1>一覧</h1>
    <ul v-for="article in getArticles" :key="article.id">
      <li>
        <label>記事のID</label>
        <p>{{ article.id }}</p>
      </li>
      <li>
        <label>タイトル</label>
        <p>{{ article.title }}</p>
      </li>
      <li>
        <label>中身</label>
        <p>{{ article.body }}</p>
      </li>
    </ul>
  </div> 
</template>

<script>
import { mapActions,mapGetters } from 'vuex';
export default {
  computed: {
    ...mapGetters(['getArticles'])
  },
  methods: {
    ...mapActions(['fetchArticles']),
  },
  created () {
    this.fetchArticles()
  }
}
</script>

<style>

</style>