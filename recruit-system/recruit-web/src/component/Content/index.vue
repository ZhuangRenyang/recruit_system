<template>
  <div class="Content">
    <p v-if="mode === 'p'">{{ data }}</p>
    <ul v-if="mode === 'ul'">
      <li v-for="(item, index) in data" :key="index">{{ item }}</li>
    </ul>
    <ol v-if="mode === 'ol'">
      <li v-for="(item, index) in data" :key="index">{{ item }}</li>
    </ol>
  </div>
</template>

<script>
export default {
  name: "Content",
  props: {
    data: {},
    mode: {
      type: String,
      default: "p",
    },
  },
};
</script>

<style scoped lang="scss">
p {
  text-indent: 2em;
}
ul li {
  list-style: none;

  &::before {
    content: "";
    display: inline-block;
    width: 8px;
    height: 8px;
    background-color: #000;
    border-radius: 50%;
    margin-right: 6px;
  }
}
ol {
  margin-left: 15px;
}
</style>