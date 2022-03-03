<template>
  <div>
    <h1>投稿</h1>
    <div>
      <div>
        <label>タイトル</label>
        <input v-model="title">
      </div>
      <div>
        <label>内容</label>
        <textarea v-model="body"></textarea>
      </div>
      <select v-model="tags" multiple>
        <option v-for="tags in getTags" :key="`first-${tags.id}`" :value="tags.id">
          {{ tags.name }}
        </option>
      </select>
      <button @click="post">送信</button>
    </div>
  </div>
</template>

<script>
import { mapActions,mapGetters } from 'vuex';
export default {
  data: function() {
    return {
      title: '',
      body: '',
      tags: []
    }
  },
  computed: {
    ...mapGetters(['getTags'])
  },
  methods: {
    ...mapActions(['fetchTags']),
    post: function() {
      this.$store.dispatch('addArticle', { article: { title: this.title, body: this .body, tag_ids: this.tags } });
      this.title = '',
      this.body = '',
      this.tags = '',
      this.$router.push("/");
    }
  },
  created() {
    this.fetchTags();
  }
}
</script>

<style>

</style>