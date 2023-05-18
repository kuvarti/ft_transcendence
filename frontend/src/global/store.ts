import { createStore } from 'vuex'

const store = createStore({
	state: {
		gamestats: {
			ingame: false
		}
	},
	getters: {
		getPlaystat(state: any): boolean {
			return state.gamestats.ingame
		}
	}
})

export default store