import { createStore } from 'vuex'

class	user{
	public isLogin: boolean;
	public username: string;
	public profile: string;
	public rank: number;
	public status: string;
}

const store = createStore({
	state: {
		login : new user(),
		gamestats: {
			ingame: false
		}
	},
	getters: {
		getPlaystat(state: any): boolean {
			return state.gamestats.ingame
		},
		getUser(state:any): user{
			return state.login
		}
	},
	mutations: {
		_setPlayStat(state: any, value: boolean) {
			state.gamestats.ingame = value
		},
		_setLogin(state: any, value: user) {
			state.login.username = value.username
			state.login.rank = value.rank
			state.login.status = value.status
			state.login.profile = value.profile
		},
		_setloginstat(state: any, value :boolean) {
			state.login.isLogin = value
		}
	},
	actions: {
		gameOn(context: any) {
			context.commit('_setPlayStat', true)
		},
		gameoff(context: any) {
			context.commit('_setPlayStat', false)
		}
	}
})

export default store