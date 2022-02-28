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
      <li>
        <label>LIKEの合計</label>
        <p>{{ article.likes_count }}</p>
      </li>
      <delete-article :id="article.id"/>
      <add-like :id="article.id" :is_like="article.is_like"/>
    </ul>
  </div> 
</template>

<script>
import { mapActions,mapGetters } from 'vuex';
import DeleteArticle from './DeleteArticle.vue';
import AddLike from './AddLike.vue';
export default {
  components: {
    DeleteArticle,
    AddLike
  },
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