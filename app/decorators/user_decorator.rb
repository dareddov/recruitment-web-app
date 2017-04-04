class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def destroy_icon
    if can?(:destroy, object)
      link_to object, method: :delete, data: { confirm: t('common.confirmation') } do
        fa_icon('trash')
      end
    end
  end

  def pretty_interests(scope = 8)
    interests = object.interests.pluck(:name)
    interests.count <= scope ? interests.join(', ') : t('common.and_more', text: interests.first(scope).join(', '))
  end
end
