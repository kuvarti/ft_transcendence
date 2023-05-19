<template>
	<div class="d-flex justify-content-end">
		<div @click="shouldExpand = !shouldExpand" class="sidemenu leftmenu" :class="shouldExpandclass">
		</div>
	</div>
</template>

<style>
.leftmenu{
	border-width: 1px 0px 1px 1px;
	border-color: white;
	border-style: solid;
	border-radius: 20px 0 0 20px;
}
</style>

<script setup lang="ts">
import { computed, ref } from "vue";
const shouldExpand = ref(false)
const shouldExpandclass = computed(() => {
	if (shouldExpand.value)
		return 'openedMenu'
	else
		return 'closedMenu'
})
</script>