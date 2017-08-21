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

  def pretty_interests(options = { })
    options = { scope: 8, all?: false, for_csv: false }.merge(options)
    interests = object.interests.pluck(:name)
    return '' if interests.blank?
    return interests.join(' ') if options[:all?] && options[:for_csv]
    return interests.join(', ') if (interests.count <= options[:scope]) || options[:all?]
    return t('common.and_more', text: interests.first(options[:scope]).join(', '))
  end
end
