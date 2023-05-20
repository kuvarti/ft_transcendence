<template>
	<div>
		<mmenu class="mainmenu" v-if="!store.getters.getPlaystat"/>
	</div>
</template>

<style scoped>
.mainmenu{
	width: 100%;
	height: 100%;
	border-radius: 5%;
	background-color: #37304066;
	/* border: 10px solid darkcyan; */
}
</style>

<script setup lang="ts">
// @ts-ignore
import { useStore } from 'vuex'
import mmenu from "./components/midMenu.vue"
const store = useStore();
</script>